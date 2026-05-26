#!/bin/bash

REPO_URL="https://github.com/MerdinTG/lab4-git.git"

case "$1" in
    --date|-d)
        date
        ;;

    --logs|-l)
        count=${2:-100}

        for i in $(seq 1 "$count")
        do
            filename="log${i}.txt"

            echo "Nazwa pliku: $filename" > "$filename"
            echo "Nazwa skryptu: $0" >> "$filename"
            echo "Data: $(date)" >> "$filename"
        done

        echo "Utworzono $count plikow log."
        ;;

    --error|-e)
        count=${2:-100}

        for i in $(seq 1 "$count")
        do
            dirname="error${i}"
            filename="${dirname}/error${i}.txt"

            mkdir -p "$dirname"

            echo "Nazwa pliku: error${i}.txt" > "$filename"
            echo "Nazwa skryptu: $0" >> "$filename"
            echo "Data: $(date)" >> "$filename"
        done

        echo "Utworzono $count katalogow error z plikami."
        ;;

    --init)
        repo_name=$(basename "$REPO_URL" .git)

        git clone "$REPO_URL"

        export PATH="$PATH:$(pwd)/$repo_name"

        echo "Sklonowano repozytorium do katalogu $repo_name"
        echo "Dodano katalog do PATH dla aktualnej sesji"
        ;;

    --help|-h)
        echo "Dostepne opcje:"
        echo "--date          wyswietla dzisiejsza date"
        echo "--logs          tworzy 100 plikow log"
        echo "--logs N        tworzy N plikow log"
        echo "--help          wyswietla pomoc"
        ;;

    *)
        echo "Nieznana opcja. Użyj --help"
        ;;
esac