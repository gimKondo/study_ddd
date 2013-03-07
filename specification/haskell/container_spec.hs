
-------------------------------------------------
-- study about class and instance
-------------------------------------------------
class Area a where
	area :: a -> Double
data Circle = Circle Double
instance Area Circle where
	area (Circle r) = pi * r * r
data Rectangular = Rectangular Double Double
	deriving Show
instance Area Rectangular where
    area (Rectangular w h) = w * h
-------------------------------------------------

-- コンテナの種類
data ContainerType = Normal | Armored | Sealed
	deriving (Show, Eq)
-- コンテナに入れるモノの種類
data MaterialType = TNT | Sand | BioSpecimen | Ammonia
	deriving (Show, Eq)
-- コンテナ
data Container = Container Int ContainerType [(MaterialType, Int)]
	deriving (Show, Eq)

-- 
class Spec a where
	-- bはaの要求仕様を満たすか？
	isSatisfiedBy2 :: a -> b -> Bool


-- リーフSpec
-- -特定のMaterialTypeがコンテナに含まれている
hasMaterialX :: MaterialType -> Container -> Bool
hasMaterialX a (Container _ _ ms) = not . null [a | a <- ms

-- -ContainerTypeがXXである
isContainerTypeX :: ContainerType -> Container -> Bool
isContainerTypeX a (Container _ ct _) = a == ct 

-- -コンテナ内に含まれる量がXX未満である

-- 強化コンテナか？
isArmored (_,Armored,_) = True
isArmored otherwise = False

-- Explosiveが含まれてないか？
isContainExplosive (_,_,c) = not . null $ filter isExplosive c

-- 
isExplosive (TNT,_) = True
isExplosive otherwise = False

-- container spec
isSatisfiedBy :: MaterialType -> (Int,ContainerType,[(MaterialType,Int)]) -> Bool
isSatisfiedBy TNT = isArmored
isSatisfiedBy BioSpecimen = not . isContainExplosive

main = do
	print $ Container 3 Normal [(TNT, 30), (Sand, 20), (BioSpecimen, 50)]
	print $ Rectangular 10.0 10.0
	let c1 = (0, Armored, [(TNT, 10), (Sand, 20)])
	print $ isSatisfiedBy TNT c1
	print $ isSatisfiedBy BioSpecimen c1


