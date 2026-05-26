#!/bin/bash

case "$1" in
    --date)
        date
        ;;

    --logs)
        for i in $(seq 1 100)
        do
            filename="log${i}.txt"

            echo "Nazwa pliku: $filename" > "$filename"
            echo "Nazwa skryptu: $0" >> "$filename"
            echo "Data: $(date)" >> "$filename"
        done

        echo "Utworzono 100 plikow log."
        ;;

    *)
        echo "Nieznana opcja. Użyj --help"
        ;;
esac