module GeosTest where

import Geos 

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
    describe "GEOS.HS MODULE UNIT TEST" $ do
        describe "vectorFromTwoPoints function unit test" $ do
            it "test_001" $ do
                vectorFromTwoPoints (Point 1.0 0.0) (Point 0.0 1.0) `shouldBe` (Vector (-1.0) 1.0) 
        
        describe "dotProduct function unit test" $ do
            it "test_001" $ do
                dotProduct (Vector 1.0 2.0) (Vector 3.0 4.0) `shouldBe` 11.0
            it "test_002" $ do
                dotProduct (Vector 0.0 2.0) (Vector 3.0 0.0) `shouldBe` 0.0

        describe "crossProduct function unit test" $ do
            it "test_001" $ do
                crossProduct (Vector 1.0 2.0) (Vector 3.0 4.0) `shouldBe` (-2) 
            it "test_002" $ do
                crossProduct (Vector 0.0 2.0) (Vector 3.0 0.0) `shouldBe` (-6) 

        describe "vectorAngle function unit test" $ do
            it "test_001" $ do
                vectorAngle (Vector 1.0 0.0) (Vector 0.0 1.0) `shouldBe` (pi / 2) 
            it "test_002" $ do
                vectorAngle (Vector 0.0 1.0) (Vector 1.0 0.0) `shouldBe` (pi / 2) 

        describe "polarAngle function unit test" $ do
            it "test_001" $ do
                polarAngle (Vector 1.0 0.0) (Vector 0.0 1.0) `shouldBe` (pi / 2) 
            it "test_002" $ do
                polarAngle (Vector 0.0 1.0) (Vector 1.0 0.0) `shouldBe` (pi / 2 * 3) 
            it "test_003" $ do
                polarAngle (Vector 0.0 1.0) (Vector 1.0 1.0) `shouldBe` (pi / 4 * 7) 
            it "test_003" $ do
                polarAngle (Vector 0.0 1.0) (Vector 0.0 1.0) `shouldBe` 0 

        describe "vectorLength function unit test" $ do
            it "test_001" $ do
                vectorLength (Vector 3.0 4.0) `shouldBe` 5.0 

        describe "radianToDegree function unit test" $ do
            it "test_001" $ do
                radianToDegree (pi /4 ) `shouldBe` 45.0 

        describe "degreeToRadian function unit test" $ do
            it "test_001" $ do
                degreeToRadian 45.0 `shouldBe` (pi / 4) 

        describe "pointOrientation function unit test" $ do
            it "test_001" $ do
                pointOrientation (Point 0.0 0.0) (Point 1.0 0.0) (Point 0.0 1.0)  `shouldBe` CCW 
            it "test_002" $ do
                pointOrientation (Point 0.0 0.0) (Point 0.0 1.0) (Point 1.0 0.0)  `shouldBe` CW 
            it "test_003" $ do
                pointOrientation (Point 0.0 0.0) (Point 0.0 1.0) (Point 0.0 2.0)  `shouldBe` CL 
