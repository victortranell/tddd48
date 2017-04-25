(define (problem uav_problem_8_0_10_20_15_2)
(:domain uav-domain)
(:objects
	uav1 - uav
	uav2 - uav
	uav3 - uav
	uav4 - uav
	uav5 - uav
	uav6 - uav
	uav7 - uav
	uav8 - uav
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	loc6 - location
	loc7 - location
	loc8 - location
	loc9 - location
	loc10 - location
	crate1 - crate
	crate2 - crate
	crate3 - crate
	crate4 - crate
	crate5 - crate
	crate6 - crate
	crate7 - crate
	crate8 - crate
	crate9 - crate
	crate10 - crate
	crate11 - crate
	crate12 - crate
	crate13 - crate
	crate14 - crate
	crate15 - crate
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
	person8 - person
	person9 - person
	person10 - person
	person11 - person
	person12 - person
	person13 - person
	person14 - person
	person15 - person
	person16 - person
	person17 - person
	person18 - person
	person19 - person
	person20 - person
	n0 n1 n2 n3 n4 - num
)
(:init

	(at depot uav1)
	(free uav1)

	(at depot uav2)
	(free uav2)

	(at depot uav3)
	(free uav3)

	(at depot uav4)
	(free uav4)

	(at depot uav5)
	(free uav5)

	(at depot uav6)
	(free uav6)

	(at depot uav7)
	(free uav7)

	(at depot uav8)
	(free uav8)
	(needs person1 medicine)
	(at loc10 person1)
	(needs person2 medicine)
	(at loc9 person2)
	(at loc5 person3)
	(needs person4 medicine)
	(at loc5 person4)
	(needs person5 medicine)
	(at loc8 person5)
	(needs person6 medicine)
	(at loc4 person6)
	(needs person7 medicine)
	(at loc8 person7)
	(at loc9 person8)
	(at loc10 person9)
	(needs person10 medicine)
	(at loc6 person10)
	(needs person11 food)
	(at loc3 person11)
	(needs person12 medicine)
	(at loc6 person12)
	(at loc1 person13)
	(at loc1 person14)
	(needs person15 food)
	(needs person15 medicine)
	(at loc6 person15)
	(needs person16 medicine)
	(at loc4 person16)
	(at loc9 person17)
	(needs person18 food)
	(at loc7 person18)
	(needs person19 food)
	(needs person19 medicine)
	(at loc4 person19)
	(at loc9 person20)
	(has crate1 food)
	(has crate2 food)
	(has crate3 food)
	(has crate4 food)
	(has crate5 medicine)
	(has crate6 medicine)
	(has crate7 medicine)
	(has crate8 medicine)
	(has crate9 medicine)
	(has crate10 medicine)
	(has crate11 medicine)
	(has crate12 medicine)
	(has crate13 medicine)
	(has crate14 medicine)
	(has crate15 medicine)
	(at depot crate1)
	(at depot crate2)
	(at depot crate3)
	(at depot crate4)
	(at depot crate5)
	(at depot crate6)
	(at depot crate7)
	(at depot crate8)
	(at depot crate9)
	(at depot crate10)
	(at depot crate11)
	(at depot crate12)
	(at depot crate13)
	(at depot crate14)
	(at depot crate15)
	(next n0 n1)
	(next n1 n2)
	(next n2 n3)
	(next n3 n4)
	(= (fly-duration loc1 loc1) 0)
	(= (fly-duration loc1 loc2) 10)
	(= (fly-duration loc1 loc3) 10)
	(= (fly-duration loc1 loc4) 10)
	(= (fly-duration loc1 loc5) 10)
	(= (fly-duration loc1 loc6) 10)
	(= (fly-duration loc1 loc7) 10)
	(= (fly-duration loc1 loc8) 10)
	(= (fly-duration loc1 loc9) 10)
	(= (fly-duration loc1 loc10) 10)
	(= (fly-duration loc1 depot) 100)
	(= (fly-duration loc2 loc1) 10)
	(= (fly-duration loc2 loc2) 0)
	(= (fly-duration loc2 loc3) 10)
	(= (fly-duration loc2 loc4) 10)
	(= (fly-duration loc2 loc5) 10)
	(= (fly-duration loc2 loc6) 10)
	(= (fly-duration loc2 loc7) 10)
	(= (fly-duration loc2 loc8) 10)
	(= (fly-duration loc2 loc9) 10)
	(= (fly-duration loc2 loc10) 10)
	(= (fly-duration loc2 depot) 100)
	(= (fly-duration loc3 loc1) 10)
	(= (fly-duration loc3 loc2) 10)
	(= (fly-duration loc3 loc3) 0)
	(= (fly-duration loc3 loc4) 10)
	(= (fly-duration loc3 loc5) 10)
	(= (fly-duration loc3 loc6) 10)
	(= (fly-duration loc3 loc7) 10)
	(= (fly-duration loc3 loc8) 10)
	(= (fly-duration loc3 loc9) 10)
	(= (fly-duration loc3 loc10) 10)
	(= (fly-duration loc3 depot) 100)
	(= (fly-duration loc4 loc1) 10)
	(= (fly-duration loc4 loc2) 10)
	(= (fly-duration loc4 loc3) 10)
	(= (fly-duration loc4 loc4) 0)
	(= (fly-duration loc4 loc5) 10)
	(= (fly-duration loc4 loc6) 10)
	(= (fly-duration loc4 loc7) 10)
	(= (fly-duration loc4 loc8) 10)
	(= (fly-duration loc4 loc9) 10)
	(= (fly-duration loc4 loc10) 10)
	(= (fly-duration loc4 depot) 100)
	(= (fly-duration loc5 loc1) 10)
	(= (fly-duration loc5 loc2) 10)
	(= (fly-duration loc5 loc3) 10)
	(= (fly-duration loc5 loc4) 10)
	(= (fly-duration loc5 loc5) 0)
	(= (fly-duration loc5 loc6) 10)
	(= (fly-duration loc5 loc7) 10)
	(= (fly-duration loc5 loc8) 10)
	(= (fly-duration loc5 loc9) 10)
	(= (fly-duration loc5 loc10) 10)
	(= (fly-duration loc5 depot) 100)
	(= (fly-duration loc6 loc1) 10)
	(= (fly-duration loc6 loc2) 10)
	(= (fly-duration loc6 loc3) 10)
	(= (fly-duration loc6 loc4) 10)
	(= (fly-duration loc6 loc5) 10)
	(= (fly-duration loc6 loc6) 0)
	(= (fly-duration loc6 loc7) 10)
	(= (fly-duration loc6 loc8) 10)
	(= (fly-duration loc6 loc9) 10)
	(= (fly-duration loc6 loc10) 10)
	(= (fly-duration loc6 depot) 100)
	(= (fly-duration loc7 loc1) 10)
	(= (fly-duration loc7 loc2) 10)
	(= (fly-duration loc7 loc3) 10)
	(= (fly-duration loc7 loc4) 10)
	(= (fly-duration loc7 loc5) 10)
	(= (fly-duration loc7 loc6) 10)
	(= (fly-duration loc7 loc7) 0)
	(= (fly-duration loc7 loc8) 10)
	(= (fly-duration loc7 loc9) 10)
	(= (fly-duration loc7 loc10) 10)
	(= (fly-duration loc7 depot) 100)
	(= (fly-duration loc8 loc1) 10)
	(= (fly-duration loc8 loc2) 10)
	(= (fly-duration loc8 loc3) 10)
	(= (fly-duration loc8 loc4) 10)
	(= (fly-duration loc8 loc5) 10)
	(= (fly-duration loc8 loc6) 10)
	(= (fly-duration loc8 loc7) 10)
	(= (fly-duration loc8 loc8) 0)
	(= (fly-duration loc8 loc9) 10)
	(= (fly-duration loc8 loc10) 10)
	(= (fly-duration loc8 depot) 100)
	(= (fly-duration loc9 loc1) 10)
	(= (fly-duration loc9 loc2) 10)
	(= (fly-duration loc9 loc3) 10)
	(= (fly-duration loc9 loc4) 10)
	(= (fly-duration loc9 loc5) 10)
	(= (fly-duration loc9 loc6) 10)
	(= (fly-duration loc9 loc7) 10)
	(= (fly-duration loc9 loc8) 10)
	(= (fly-duration loc9 loc9) 0)
	(= (fly-duration loc9 loc10) 10)
	(= (fly-duration loc9 depot) 100)
	(= (fly-duration loc10 loc1) 10)
	(= (fly-duration loc10 loc2) 10)
	(= (fly-duration loc10 loc3) 10)
	(= (fly-duration loc10 loc4) 10)
	(= (fly-duration loc10 loc5) 10)
	(= (fly-duration loc10 loc6) 10)
	(= (fly-duration loc10 loc7) 10)
	(= (fly-duration loc10 loc8) 10)
	(= (fly-duration loc10 loc9) 10)
	(= (fly-duration loc10 loc10) 0)
	(= (fly-duration loc10 depot) 100)
	(= (fly-duration depot loc1) 100)
	(= (fly-duration depot loc2) 100)
	(= (fly-duration depot loc3) 100)
	(= (fly-duration depot loc4) 100)
	(= (fly-duration depot loc5) 100)
	(= (fly-duration depot loc6) 100)
	(= (fly-duration depot loc7) 100)
	(= (fly-duration depot loc8) 100)
	(= (fly-duration depot loc9) 100)
	(= (fly-duration depot loc10) 100)
	(= (fly-duration depot depot) 0)
)
(:goal (and

	(at depot uav1)

	(at depot uav2)

	(at depot uav3)

	(at depot uav4)

	(at depot uav5)

	(at depot uav6)

	(at depot uav7)

	(at depot uav8)

	(has person1 medicine)
	(has person2 medicine)
	(has person4 medicine)
	(has person5 medicine)
	(has person6 medicine)
	(has person7 medicine)
	(has person10 medicine)
	(has person11 food)
	(has person12 medicine)
	(has person15 food)
	(has person15 medicine)
	(has person16 medicine)
	(has person18 food)
	(has person19 food)
	(has person19 medicine)
	))
)
