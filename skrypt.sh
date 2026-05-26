#!/bin/bash

case "$1" in
    --date)
        date
        ;;

    --logs)
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

    *)
        echo "Nieznana opcja. Użyj --help"
        ;;
esac