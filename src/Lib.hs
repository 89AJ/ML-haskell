module Lib
    ( someFunc
    , someFunc'
    , newFunc
    , calcAccuracy
    , anotherFunc
    ) where

import Acme.Missiles
import qualified MachineLearning.Types as T
import qualified MachineLearning.Classification.Binary as BC


someFunc :: IO ()
someFunc = putStrLn "someFunc"

someFunc' :: IO ()
someFunc' = putStrLn "someFunc2"

-- newFunc :: Num -> Num
newFunc x = x + 2

anotherFunc x =  show $ 2 + newFunc x


calcAccuracy :: T.Matrix -> T.Vector -> T.Vector -> T.R
calcAccuracy x y theta = BC.calcAccuracy y yPredicted
    where yPredicted = BC.predict x theta
