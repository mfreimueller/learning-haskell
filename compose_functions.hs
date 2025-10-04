-- The Art of Functional Programming
-- 3.6.5 Challenge 5: Compose functions

double :: Int -> Int
double x = x * 2

inc :: Int -> Int
inc x = x + 1

compose :: (Int -> Int) -> (Int -> Int) -> (Int -> Int)
compose a b = a . b

main :: IO()
main = do
    print (compose double inc 0)
    print (compose double inc 1)
    print (compose double inc 2)