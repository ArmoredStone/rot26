# A meme

Introduces approaches for implementation of ROT26 string shift mechanics in multiple programming languages.

In current implementation shifting is not bound to alphabet table and rotates around all the symbols programming language encoding specify.

# ROT26

ROT26 is a trivial modification of the ROT13 algorithm. Both are simple letter substitution ciphers that replace a letter with the letter 26 (or 13) places after it in the alphabet. Since ROT26 shifts each letter by 26 places, and there are only 26 letters in the English alphabet, each letter is effectively replaced by itself, rendering the algorithm useless for encryption purposes.

# Schematics

Execution is performed through passing a mode specifier and a string as command line arguments.

Modes are: "r" for right-way shift and "l" for left-way shift.
