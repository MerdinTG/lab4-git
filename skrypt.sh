#!/bin/bash

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