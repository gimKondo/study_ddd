import Data.List

{------------------------------------------
 - ���m
 ------------------------------------------}
-- �R���e�i�̎��
data ContainerType = Normal | Armored | HighArmored | Sealed
	deriving (Show, Eq)
-- �R���e�i�ɓ���郂�m�̎��
data Material = TNT | Gasoline | Sand | BioSpecimen | Ammonia
	deriving (Show, Eq)
-- �h������
data Drum = Drum Material Int 
	deriving (Show, Eq)
-- �R���e�i
-- name, ContainerType, [(Material, amount)]
data Container = Container String ContainerType [Drum]
	deriving (Show, Eq)


{------------------------------------------
 - Spec�w���p
 ------------------------------------------}
-- �����Material���R���e�i�Ɋ܂܂�Ă���
hasMaterialX :: Material -> Container -> Bool
hasMaterialX a (Container _ _ ms) =  a `elem` [mt | (Drum mt _) <- ms]

-- ����̏����𖞂���Material���R���e�i�Ɋ܂܂�Ă���
hasConditinalMaterial :: (Material -> Bool) -> Container -> Bool
hasConditinalMaterial cond (Container _ _ ms) = any cond [mt | (Drum mt _) <- ms]

-- ContainerType��XX�ł���
isContainerTypeX :: ContainerType -> Container -> Bool
isContainerTypeX a (Container _ ct _) = a == ct 

-- �R���e�i���Ɋ܂܂��ʂ�XX���I�[�o�[���Ă���
isOverAmount :: Material -> Int -> Container -> Bool
isOverAmount mt limit (Container _ _ ms) = limit <  amount
	where amount = sum [v | (Drum trg_mt v) <- ms, trg_mt == mt]

-- ���������H
isExplosive :: Material -> Bool
isExplosive TNT = True
isExplosive Gasoline = True
isExplosive otherwise = False

{------------------------------------------
 - ���[�tSpec
 ------------------------------------------}
-- TNT�������Ă��Ȃ����H
containTNT :: Container -> Bool
containTNT container = hasMaterialX TNT container

-- �������������Ă��Ȃ����H
containExplosive :: Container -> Bool
containExplosive container = hasConditinalMaterial isExplosive container

-- �����R���e�i���H
isArmored :: Container -> Bool
isArmored container = isContainerTypeX Armored container

-- ���x�����R���e�i���H
isHighArmored :: Container -> Bool
isHighArmored container = isContainerTypeX HighArmored container

-- ���R���e�i���H
isSealed :: Container -> Bool
isSealed container = isContainerTypeX Sealed container

-- �R���e�i����200�ȏ�����Ă��Ȃ����H
isOverAmount200 :: Container -> Material -> Bool
isOverAmount200 container mt = isOverAmount mt 200 container

{------------------------------------------
 - �eMaterial�̗v���d�l
 ------------------------------------------}
-- container spec
isSatisfiedBy :: Material -> Container -> Bool
-- TNT�͋����R���e�i�܂��͍��x�����R���e�i�ɓ����Ă���K�v������
isSatisfiedBy TNT c = or [isArmored c, isHighArmored c]
-- Gasoline�͍��x�����R���e�i���K�v�ŁATNT�ƈꏏ�ɓ���Ă̓_���ŁA200�ȏ����Ă��_��
isSatisfiedBy Gasoline c = and [isHighArmored c, (not . containTNT) c, isOverAmount200 c Gasoline]
-- Sand�͈ύ׋C�ɂ���
isSatisfiedBy Sand _ = True
-- BioSpecimen�͔������ƈꏏ�̓_��
isSatisfiedBy BioSpecimen c = containExplosive c
-- Ammonia�͖��R���e�i�łȂ���΃_��
isSatisfiedBy Ammonia c = isSealed c


{------------------------------------------
 - �eMaterial�̗v���d�l�𖞂����Ă��Ȃ���Ԃ�
 - �R���e�i�̖��O���N��
 ------------------------------------------}
discloseWrongContainer :: [Container] -> [String]
discloseWrongContainer cs = nub [name | (Container name _ [Drum mt _]) <- cs, c <- cs, isSatisfiedBy mt c]

{------------------------------------------
 - �R���e�i���X�g
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
	


