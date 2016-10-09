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

exe (output:input:_) = do
    putStrLn output
    putStrLn input
    putStrLn hello
