import System.IO 
import Control.Exception (try, IOException)

countLines :: String -> Int
countLines = length . lines

main :: IO()
main = do
    putStrLn "Enter path to file to count its lines: "
    path <- getLine

    -- We create a tuple (I think) containing either an exception on the left
    -- side, or the content on the right. This we can then check using case Left/Right
    -- By convention Left is always an error, while Right is the value.
    result <- try (readFile path) :: IO (Either IOException String)

    case result of
        Left ex -> hPutStrLn stderr $ "Error: " ++ show ex
        Right content -> putStrLn $ "Total number of lines: " ++ show (countLines content)

-- naive version:

-- countLines :: String -> Integer

-- -- 
-- countLines content = do
--     let totalLines = lines content
--     listLength totalLines
--     where 
--         listLength :: [String] -> Integer
--         listLength[] = 0

-- This is how you would iterate over a list and count its elements
-- (given that you don't use the built-in `length` function).
-- Basically you cut away the head with each recursive step
-- and increment by 1 each time:
--         listLength (x:xs) = 1 + listLength xs

-- main :: IO ()
-- main = do
--     putStrLn "Enter path to file to count its lines: "
--     path <- getLine

--     content <- readFile path

--     let lines = countLines content

-- You could use parentheses. More Haskell-native would be using $, probably
--     putStrLn ("Total number of lines: " ++ show lines)
    
