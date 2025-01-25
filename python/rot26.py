# Python rot26 implementation
# by ArmoredStone
# 24.01.2025

import sys

def rotate_string(input_str, mode):
    result = ""
    shift = 26
    for k in input_str:
        if mode == 'left':
            result += chr(ord(k) - shift)
        elif mode == 'right':
            result += chr(ord(k) + shift)
        else:
            print("Usage: python rot26.py [left|right] <string>")
            sys.exit(1)
    return result

def main():
    if len(sys.argv) != 3:
        print("Usage: python rot26.py [left|right] <string>")
        sys.exit(1)
    
    mode = sys.argv[1]
    input_string = str(sys.argv[2])

    if mode not in ['left', 'right']:
        print("Mode must be either 'left' or 'right'")
        sys.exit(1)

    rotated_string = rotate_string(input_string, mode)
    print(rotated_string)

if __name__ == "__main__":
    main()
