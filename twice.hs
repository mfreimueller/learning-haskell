-- The Art of Functional Programming
-- 3.6.4 Challenge 4: Apply a function twice

inc :: Int -> Int
inc x = x + 1

twice :: (Int -> Int) -> Int -> Int
twice fun val = fun (fun val)

main :: IO()
main = do
    print (twice inc 0)
    print (twice inc 1)
    print (twice inc 2)