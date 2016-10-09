-- | Data.Index is a package for adding index column to data files
module Data.Index 
    ( hello
    , addTime) where

-- | say hello
hello :: String
hello = "Hello Data.Index!"

-- | Add an time column
-- usage: addTime <data array> <time unit>
addTime :: Num a => [[a]] -> a -> [[a]]
addTime array time_unit = aux array time_unit []
    where
        aux :: Num a => [[a]] -> a -> [[a]] -> [[a]]
        aux [] _ accum = reverse accum
        aux (x:xs) unit accum = aux xs unit ((i:x):accum)
            where i = unit * (fromIntegral ((length accum) + 1))