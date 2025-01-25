# PowerShell rot26 implementation
# by ArmoredStone
# 24.01.2025

param (
    [string]$mode,   # Mode: "left" or "right"
    [string]$inputString  # The string to rotate
)

if ($mode -notin "left", "right") {
    Write-Error "Invalid mode. Use 'left' or 'right'."
    exit 1
}

function Rotate-Char {
    param (
        [char]$char,
        [string]$mode
    )

    [int]$shiftValue = 26
    $asciiValue = [int][char]$char

    # Calculate the new ASCII value based on the mode
    if ($mode -eq "left") {
        $newAsciiValue = $asciiValue - $shiftValue
    } elseif ($mode -eq "right") {
        $newAsciiValue = $asciiValue + $shiftValue
    } else {
        Write-Host "Invalid mode. Use 'left' or 'right'."
        return
    }

    # To consider handle overflow and underflow // ASCII range: 0-255
    if ($newAsciiValue -gt 255) {
        $newAsciiValue -= 255
    } elseif ($newAsciiValue -lt 0) {
        $newAsciiValue += 255
    }

    return [char]$newAsciiValue
}

function Rotate-String {
    param (
        [string]$mode,
        [string]$inputString
    )

    $charArray = $inputString.ToCharArray()
    $rotatedArray = @()

    foreach ($char in $charArray) {
        $newAsciiValue = Rotate-Char -char $char -mode $mode
        $rotatedArray += [char][int]$newAsciiValue
    }

    return -join $rotatedArray
}

$result = Rotate-String -mode $mode -inputString $inputString

Write-Host $result
