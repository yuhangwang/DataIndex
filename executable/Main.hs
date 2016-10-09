import Data.Index
import System.Environment
import System.Exit
import Data.List

main :: IO ()
main = do
    args <- getArgs
    exe args

usage :: String
usage = "USAGE: DataIndex output.data input.dat"

exe :: [String] -> IO ()
exe [] = do 
    putStrLn usage
    exitFailure

exe [_] = do 
    putStrLn usage
    exitFailure
exe [_,_] = do 
    putStrLn usage
    exitFailure

exe (output:input:time_unit:_) = do
    content <- readFile input
    let dat = loadData content
    let unit = read time_unit :: Float
    save output (addTime dat unit)

loadData :: String -> [[Float]]
loadData content = fmap ((fmap read) . words) (lines content)

array2str :: Show a => [[a]] -> String 
array2str [] = ""
array2str array = aux array []
    where
        aux :: Show a => [[a]] -> [String] -> String
        aux [] accum = intercalate "\n" (reverse accum)
        aux (x:xs) accum = aux xs ((unwords (map show x)):accum)

save :: Show a => String -> [[a]] -> IO ()
save output_file dat = do
    writeFile output_file (array2str dat)
