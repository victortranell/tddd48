(define (problem emergency1)
        (:domain emergency)
        (:objects 
                  heli0 - uav
                  heli1 - uav
                  depot0 - depot
		  depotloc - location
                  p0 - location
                  p1 - location
                  p2 - location
                  p3 - location
                  medicine - type
                  food - type
                  carrier0 - carrier
                  carrier1 - carrier
        )
        (:init    
				  (loc depot0 depotloc)
                  (loc heli0 depotloc)
                  (loc heli1 depotloc)
				  (empty heli0)
				  (empty heli1)
                  (loc carrier0 depotloc)
                  (loc carrier1 depotloc)
                  (= (used carrier0) 0)
                  (= (used carrier1) 0)
                  (= (unused carrier0) 4)
                  (= (unused carrier1) 4)
                  (= (boxcount carrier0 medicine) 0)
                  (= (boxcount carrier1 medicine) 0)
                  (= (boxcount carrier0 food) 0)
                  (= (boxcount carrier1 food) 0)
                  (= (cratesUndelivered medicine depotloc) 0)
                  (= (cratesUndelivered medicine p0) 4)
                  (= (cratesUndelivered medicine p1) 3)
                  (= (cratesUndelivered medicine p2) 1)
                  (= (cratesUndelivered medicine p3) 0)
                  (= (cratesUndelivered food depotloc) 0)
                  (= (cratesUndelivered food p0) 0)
                  (= (cratesUndelivered food p1) 1)
                  (= (cratesUndelivered food p2) 3)
                  (= (cratesUndelivered food p3) 4)
        )

        (:goal    (and 
                     (= (cratesUndelivered medicine p1) 0)
                     (= (cratesUndelivered medicine p2) 0)
                     (= (cratesUndelivered medicine p3) 0)
                     (= (cratesUndelivered food p0) 0)
                     (= (cratesUndelivered food p1) 0)
                     (= (cratesUndelivered food p2) 0)
                     (= (cratesUndelivered food p3) 0)

                  )
        )
)
