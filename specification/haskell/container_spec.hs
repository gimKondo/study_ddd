import Data.List

{------------------------------------------
 - モノ
 ------------------------------------------}
-- コンテナの種類
data ContainerType = Normal | Armored | HighArmored | Sealed
	deriving (Show, Eq)
-- コンテナに入れるモノの種類
data Material = TNT | Gasoline | Sand | BioSpecimen | Ammonia
	deriving (Show, Eq)
-- ドラム缶
data Drum = Drum Material Int 
	deriving (Show, Eq)
-- コンテナ
-- name, ContainerType, [(Material, amount)]
data Container = Container String ContainerType [Drum]
	deriving (Show, Eq)


{------------------------------------------
 - Specヘルパ
 ------------------------------------------}
-- 特定のMaterialがコンテナに含まれている
hasMaterialX :: Material -> Container -> Bool
hasMaterialX a (Container _ _ ms) =  a `elem` [mt | (Drum mt _) <- ms]

-- 特定の条件を満たすMaterialがコンテナに含まれている
hasConditinalMaterial :: (Material -> Bool) -> Container -> Bool
hasConditinalMaterial cond (Container _ _ ms) = any cond [mt | (Drum mt _) <- ms]

-- ContainerTypeがXXである
isContainerTypeX :: ContainerType -> Container -> Bool
isContainerTypeX a (Container _ ct _) = a == ct 

-- コンテナ内に含まれる量がXXをオーバーしている
isOverAmount :: Material -> Int -> Container -> Bool
isOverAmount mt limit (Container _ _ ms) = limit <  amount
	where amount = sum [v | (Drum trg_mt v) <- ms, trg_mt == mt]

-- 爆発物か？
isExplosive :: Material -> Bool
isExplosive TNT = True
isExplosive Gasoline = True
isExplosive otherwise = False

{------------------------------------------
 - リーフSpec
 ------------------------------------------}
-- TNTが入っていないか？
containTNT :: Container -> Bool
containTNT container = hasMaterialX TNT container

-- 爆発物が入っていないか？
containExplosive :: Container -> Bool
containExplosive container = hasConditinalMaterial isExplosive container

-- 強化コンテナか？
isArmored :: Container -> Bool
isArmored container = isContainerTypeX Armored container

-- 高度強化コンテナか？
isHighArmored :: Container -> Bool
isHighArmored container = isContainerTypeX HighArmored container

-- 密閉コンテナか？
isSealed :: Container -> Bool
isSealed container = isContainerTypeX Sealed container

-- コンテナ内に200以上入っていないか？
isOverAmount200 :: Container -> Material -> Bool
isOverAmount200 container mt = isOverAmount mt 200 container

{------------------------------------------
 - 各Materialの要求仕様
 ------------------------------------------}
-- container spec
isSatisfiedBy :: Material -> Container -> Bool
-- TNTは強化コンテナまたは高度強化コンテナに入っている必要がある
isSatisfiedBy TNT c = or [isArmored c, isHighArmored c]
-- Gasolineは高度強化コンテナが必要で、TNTと一緒に入れてはダメで、200以上入れてもダメ
isSatisfiedBy Gasoline c = and [isHighArmored c, (not . containTNT) c, isOverAmount200 c Gasoline]
-- Sandは委細気にせず
isSatisfiedBy Sand _ = True
-- BioSpecimenは爆発物と一緒はダメ
isSatisfiedBy BioSpecimen c = containExplosive c
-- Ammoniaは密閉コンテナでなければダメ
isSatisfiedBy Ammonia c = isSealed c


{------------------------------------------
 - 各Materialの要求仕様を満たしていない状態の
 - コンテナの名前を晒す
 ------------------------------------------}
discloseWrongContainer :: [Container] -> [String]
discloseWrongContainer cs = nub [name | (Container name _ [Drum mt _]) <- cs, c <- cs, isSatisfiedBy mt c]

{------------------------------------------
 - コンテナリスト
 ------------------------------------------}
containers = [	 Container "Iro" Normal [(Drum TNT 30), (Drum Sand 20)]
				,Container "Ha"  HighArmored [(Drum Gasoline 20), (Drum Gasoline 80)]
				,Container "Niwo" Normal [(Drum Ammonia 30), (Drum Sand 100)]
				,Container "Chiri" Normal [(Drum Sand 10)] ]

{------------------------------------------
 - 
 ------------------------------------------}
main = do
	putStrLn $ unlines $ map show containers
	putStrLn $ unlines $ discloseWrongContainer containers
	


