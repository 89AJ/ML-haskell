{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import qualified Data.Text.IO as T
import qualified MachineLearning.Types as T
import qualified Numeric.LinearAlgebra as LA
import qualified MachineLearning as ML
import qualified MachineLearning.Classification.Binary as BC


main = do                  
    -- Step 1. Data loading.
    designMatrix <- LA.loadMatrix "data.txt"
    let (x, y) = ML.splitToXY designMatrix
    -- Step 2. Feature normalization (skipped - we don't need feature normalization if we use BFGS2).
    -- See Linear Regression sample app for dedails.
    
    -- Step 3. Feature mapping.
        x1 = ML.addBiasDimension $ ML.mapFeatures 6 x

    -- Step 4. Learning
        zeroTheta = LA.konst 0 (LA.cols x1)
        (theta, _) = BC.learn (BC.BFGS2 0.1 0.1) 0.000002 1500 (BC.L2 1) x1 y zeroTheta

    -- Step 5. Prediction and checking accuracy
        accuracy = calcAccuracy x1 y theta

    -- Step 6. Printing results.
    putStrLn "\n=== Logistic Regression Sample Application ===\n"

    putStrLn ""
    putStrLn $ "Theta:             " ++ (show theta)
    
    putStrLn ""
    putStrLn $ "Accuracy on training set data (%): " ++ show (accuracy*100)

    putStrLn "This is me"
    someFunc' 
    T.putStrLn "someFunc"
    putStrLn $ anotherFunc 5
