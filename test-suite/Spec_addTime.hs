module Spec_addTime (test_addTime) where 
import Data.Index
import Test.Tasty.Hspec

test_addTime :: Spec
test_addTime = parallel $ do
    it "should return []" $ do
        (addTime [] (1.0::Double)) `shouldBe` []