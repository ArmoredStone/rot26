-- Haskell rot26 implementation
-- by ArmoredStone
-- 24.01.2025

import System.IO
import System.Environment (getArgs)

main :: IO ()
main = do
    hSetEncoding stdout utf8
    hSetEncoding stdin utf8
    
    args <- getArgs
    let mode = head (head args)
        textChars = unwords (tail args)
        result = modeCase mode textChars
    putStrLn (result)

modeCase :: Char -> [Char] -> [Char]
modeCase mode text = case mode of
    'e' -> map applySucc26times text
    'd' -> map applyPred26times text
    _ -> "Invalid mode, use e or d"

applySucc26times :: Char -> Char
applySucc26times = (!! 26) . iterate succ

applyPred26times :: Char -> Char
applyPred26times = (!! 26) . iterate pred
