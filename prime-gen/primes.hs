-- First, naive approach:
-- isPrime :: Integer -> Integer -> Bool

-- isPrime n divisor
--   | divisor == 1 = True
--   | mod n divisor == 0 = False
--   | otherwise = isPrime n (divisor - 1)

-- Second, better approach

-- We move the logic into a helper method `go` and 
-- start with the square root of n.
isPrime :: Integer -> Bool
isPrime n
  | n <= 1 = False
  -- (floor . sqrt $ fromIntegral n) is kind of wild...
  -- We start from the right side and convert n into a double,
  -- then we use the $-operator to skip parentheses and make
  -- the code more human readible,
  -- then we take the square root of the double value and finally
  -- turn it into an integer again, to use it as a starting value
  -- for our helper method `go`.
  | otherwise = go n (floor . sqrt $ fromIntegral n)
  where
    go :: Integer -> Integer -> Bool
    go _ 1 = True
    go n divisor
      | mod n divisor == 0 = False
      | otherwise = go n (divisor - 1)

main :: IO ()
main = do 
  putStrLn "Which number to check? "
  input <- getLine 
  
  let n = read input :: Integer

  if isPrime n
    then putStrLn (show n ++ " is a prime number!")
    else putStrLn (show n ++ " is not a prime number!")