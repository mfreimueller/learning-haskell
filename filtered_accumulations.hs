-- The Art of Functional Programming
-- 3.6.6 Challenge 6: Filtered accumulation

accumulate :: (Int -> Int -> Int) -> Int -> (Int -> Int) -> Int -> Int -> Int
accumulate combiner init term m n
    | m > n = init
    | otherwise = combiner (term m) (accumulate combiner init term (m + 1) n)

filteredAccumulate :: (Int -> Int -> Int) -> Int -> (Int -> Int) -> (Int -> Bool) -> Int -> Int -> Int
filteredAccumulate combiner init term predicate m n 
    | m > n = init
    | not (predicate m) = filteredAccumulate combiner init term predicate (m + 1) n
    | otherwise = combiner (term m) (filteredAccumulate combiner init term predicate (m + 1) n)

isPrime :: Int -> Bool
isPrime x
    | x <= 1 = False
    | x == 2 = True
    | otherwise = primeHelper x (floor . sqrt $ fromIntegral x)
        where
            primeHelper :: Int -> Int -> Bool
            primeHelper n x
                | x <= 1 = True
                | mod n x == 0 = False
                | otherwise = primeHelper n (x - 1)

main :: IO()
main = do
    print (accumulate (+) 0 id 1 4) -- note: id is the identity function (\x -> x)

    print (filteredAccumulate (+) 0 id isPrime 1 4)
    print (filteredAccumulate (+) 0 id isPrime 2 5)
    print (filteredAccumulate (+) 0 id isPrime 3 7)
