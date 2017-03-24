(define (problem tmp)
(:domain uav-domain)
(:objects
	uav1 - uav
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
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
	food - contents
	medicine - contents
	person1 - person
	person2 - person
	person3 - person
)
(:init

	(at depot uav1)
	(free uav1)
	(needs person1 food)
	(at loc3 person1)
	(needs person2 medicine)
	(at depot person2)
	(needs person3 food)
	(needs person3 medicine)
	(at depot person3)
	(has crate1 food)
	(has crate2 food)
	(has crate3 medicine)
	(has crate4 medicine)
	(has crate5 medicine)
	(has crate6 medicine)
	(has crate7 medicine)
	(has crate8 medicine)
	(has crate9 medicine)
	(has crate10 medicine)
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
)
(:goal (and

	(at depot uav1)

	(has person1 food)
	(has person2 medicine)
	(has person3 food)
	(has person3 medicine)
	))
)
