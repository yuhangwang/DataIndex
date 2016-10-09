import qualified Test.Tasty
import Test.Tasty.Hspec
import Spec_addTime

main :: IO ()
main = do
    test <- testSpec "addTime" test_addTime
    Test.Tasty.defaultMain test

