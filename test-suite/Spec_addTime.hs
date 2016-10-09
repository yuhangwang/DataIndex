module Spec_addTime (test_addTime) where 
import Data.Index
import Test.Tasty.Hspec

test_addTime :: Spec
test_addTime = parallel $ do
    it "addTime [] 1. should return []" $ do
        (addTime [] (1.0::Double)) `shouldBe` []

    it "addTime [[1],[2]] 1 should return [[1,1],[2,2]]" $ do
        (addTime [[1],[2]] (1::Int)) `shouldBe` [[1,1],[2,2]]

    it "addTime [[1,10],[2,20]] 1 should return [[1,1,10],[2,2,20]]" $ do
        (addTime [[1,10],[2,20]] (1::Int)) `shouldBe` [[1,1,10],[2,2,20]]

    it "addTime [[1],[2]] 2 should return [[2,1],[4,2]]" $ do
        (addTime [[1],[2]] (2::Int)) `shouldBe` [[2,1],[4,2]]

    it "addTime [[1.0],[2.0]] 1 should return [[1.0,1.0],[2.0,2.0]]" $ do
        (addTime [[1.0],[2.0]] (1.0::Float)) `shouldBe` [[1.0,1.0],[2.0,2.0]]