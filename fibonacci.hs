fib :: Int -> Int
fib n
    | n <= 0 = 0
    | n == 1 = 1
    | n == 2 = 1
    | otherwise = fib (n - 1) + fib (n - 2)

main :: IO()
main = do
    putStrLn "Which fibonacci number should be calculated? "
    input_n <- getLine
    let n = (read input_n :: Int)
    print (show (fib n))
