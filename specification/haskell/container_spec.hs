
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

-- �R���e�i�̎��
data ContainerType = Normal | Armored | Sealed
	deriving (Show, Eq)
-- �R���e�i�ɓ���郂�m�̎��
data MaterialType = TNT | Sand | BioSpecimen | Ammonia
	deriving (Show, Eq)
-- �R���e�i
data Container = Container Int ContainerType [(MaterialType, Int)]
	deriving (Show, Eq)

-- 
class Spec a where
	-- b��a�̗v���d�l�𖞂������H
	isSatisfiedBy2 :: a -> b -> Bool


-- ���[�tSpec
-- -�����MaterialType���R���e�i�Ɋ܂܂�Ă���
hasMaterialX :: MaterialType -> Container -> Bool
hasMaterialX a (Container _ _ ms) = not . null [a | a <- ms

-- -ContainerType��XX�ł���
isContainerTypeX :: ContainerType -> Container -> Bool
isContainerTypeX a (Container _ ct _) = a == ct 

-- -�R���e�i���Ɋ܂܂��ʂ�XX�����ł���

-- �����R���e�i���H
isArmored (_,Armored,_) = True
isArmored otherwise = False

-- Explosive���܂܂�ĂȂ����H
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


