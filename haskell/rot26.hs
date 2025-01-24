-- Haskell rot26 implementation
-- by ArmoredStone
-- 24.01.2025

import System.Environment (getArgs)

-- encode :: [Char] -> [Char]
-- decode :: [Char] -> [Char]

main :: IO ()
main = do
    args <- getArgs
    putStrLn $ show args