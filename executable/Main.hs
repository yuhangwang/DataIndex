import Data.Index
import System.Environment
import System.Exit
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
    data <- loadData input
    let unit = read input :: Float
    save output (addTime data unit)

loadData :: Num a => FilePath -> IO [[Float]]
loadData file_path = fmap ((fmap read) . words) (lines (readFile file_path))

save :: String -> [[a]] -> IO ()
save output_file data = do
    out = openFile output_file WriteMode
    hPrint out data
    hClose out