// Go rot26 implementation
// by ArmoredStone
// 24.01.2025

package main

import (
	"fmt"
	"os"
	"strings"
)

func rotateChar(char rune, mode string) rune {
	shift := 26 
	if mode == "left" {
		return rune(int(char) - shift)
	} else if mode == "right" {
		return rune(int(char) + shift)
	} else {
		fmt.Println("Invalid mode. Use 'left' or 'right'.")
		return rune(0)
	}
}

func rotateString(str string, mode string) string {
	var result strings.Builder
	for _, char := range str {
		result.WriteRune(rotateChar(char, mode))
	}
	return result.String()
}

func main() {
	if len(os.Args) != 3 {
		fmt.Println("Usage: go run main.go <left/right> <string>")
		return
	}

	mode := os.Args[1]
	inputString := os.Args[2]
	result := rotateString(inputString, mode)
	fmt.Println(result)
}
