fib :: Int -> Int
fib n
    | n <= 0 = 0
    | n == 1 = 1
    | n == 2 = 1
    | otherwise = fib (n - 1) + fib (n - 2)

superFib :: Int -> Int
superFib n
    | n == 0 = 0
    | n == 1 = 1
    | n == 2 = 1
    | otherwise = 1 + optFib (n - 1) 0 1
    where
        optFib :: Int -> Int -> Int -> Int
        optFib n a b
            | n <= 0 = 0
            | otherwise = a + optFib (n - 1) b (a + b)

main :: IO()
main = do
    putStrLn "Which fibonacci number should be calculated? "
    input_n <- getLine
    let n = (read input_n :: Int)
    -- print (show (fib n))
    print (show (superFib n))
