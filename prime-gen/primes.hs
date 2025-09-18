-- First, naive approach:
-- isPrime :: Integer -> Integer -> Bool

-- isPrime n divisor
--   | divisor == 1 = True
--   | mod n divisor == 0 = False
--   | otherwise = isPrime n (divisor - 1)

-- Second, better approach
isPrime :: Integer -> Bool
isPrime n
  | n <= 1 = False
  -- We start with the square root of n
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
  -- print(isPrime n (n - 1))

  if isPrime n
    then putStrLn (show n ++ " is a prime number!")
    else putStrLn (show n ++ " is not a prime number!")