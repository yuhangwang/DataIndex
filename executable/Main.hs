import Data.Index
import System.Environment
import System.Exit
import System.IO 

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

save :: Show a => String -> [[a]] -> IO ()
save output_file dat = do
    out <- openFile output_file WriteMode
    hPrint out dat
    hClose out