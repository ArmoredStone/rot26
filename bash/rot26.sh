#!/bin/bash

# Check if the correct number of arguments are passed
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <mode> <string>"
    echo "Modes: -l for left, -r for right"
    exit 1
fi

# Get the command line arguments
mode_key="$1"
input_string="$2"

# Check if the mode is valid
if [[ "$mode_key" != "-r" && "$mode_key" != "-l" ]]; then
  echo "Invalid mode. Use -r for right rotation or -l for left rotation."
  exit 1
fi

# Determine the mode based on the key
case "$mode_key" in
    -l)
        shift_mode="left"
        ;;
    -r)
        shift_mode="right"
        ;;
    *)
        echo "Invalid mode key. Use '-l' for left or '-r' for right."
        exit 1
        ;;
esac

shift_string() {
    local input="$1"
    local shift_mode="$2"
    local result=""

    for (( i=0; i<${#input}; i++ )); do
        char="${input:$i:1}"
        ascii=$(printf "%d" "'$char")

        if [[ "$shift_mode" == "left" ]]; then
            new_ascii=$((ascii - 26))
        elif [[ "$shift_mode" == "right" ]]; then
            new_ascii=$((ascii + 26))
        else
            echo "Invalid mode. Use '-l' for left or '-r' for right."
            return 1
        fi

        # Handle wrapping around the ASCII table
        if (( new_ascii < 0 )); then
            new_ascii=$((new_ascii + 256))
        elif (( new_ascii > 255 )); then
            new_ascii=$((new_ascii - 256))
        fi

        new_char=$(printf "\\$(printf '%03o' "$new_ascii")")
        result+="$new_char"
    done
    echo "$result"
}


# Call the shift_string function with the provided arguments
shifted_string=$(shift_string "$input_string" "$shift_mode")
echo "$shifted_string"
