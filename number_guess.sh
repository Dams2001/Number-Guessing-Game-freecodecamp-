#!/bin/bash
# Configurar la conexin a la base de datos
PSQL="psql -q --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

# Generar un nmero secreto aleatorio entre 1 y 1000
secret_number=$(( ( RANDOM % 1000 )  + 1 ))

# Pedir el nombre de usuario al usuario
echo "Enter your username:"
read username

# Verificar si el nombre de usuario ya existe en la base de datos
user_exists=$($PSQL "SELECT COUNT(*) FROM users WHERE username='$username'")

if [ "$user_exists" -eq 1 ]; then
    # Si el usuario ya existe, recuperar sus datos y mostrar un mensaje de bienvenida
    user_data=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$username'")
    games_played=$(echo "$user_data" | cut -d '|' -f 1)
    best_game=$(echo "$user_data" | cut -d '|' -f 2)
    echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
else
    # Si el usuario no existe, insertarlo en la base de datos y mostrar un mensaje de bienvenida
    $PSQL "INSERT INTO users (username, games_played, best_game) VALUES ('$username', 0, NULL)"
    echo "Welcome, $username! It looks like this is your first time here."
fi

# Inicializar el contador de intentos
number_of_guesses=0

# Pedir al usuario que adivine el nmero secreto
echo -e "Guess the secret number between 1 and 1000:"
while true; do
    read guess

    # Verificar si el valor ingresado es un nmero entero
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
        continue
    fi

    # Incrementar el contador de intentos
    number_of_guesses=$((number_of_guesses+1))

    # Verificar si el usuario adivin el nmero secreto
    if [ "$guess" -eq "$secret_number" ]; then
        echo -e "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
        # Actualizar los datos del usuario en la base de datos
        $PSQL "UPDATE users SET games_played=games_played+1 WHERE username='$username'"
        $PSQL "UPDATE users SET best_game=$number_of_guesses WHERE username='$username' AND (best_game IS NULL OR best_game > $number_of_guesses)"
        break
    elif [ "$guess" -lt "$secret_number" ]; then
        echo "It's higher than that, guess again:"
    else
        echo "It's lower than that, guess again:"
    fi
done
