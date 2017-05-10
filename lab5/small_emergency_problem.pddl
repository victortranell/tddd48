(define (problem emergency1)
        (:domain emergency)
        (:objects 
                  heli0 - uav
                  depot0 - depot
		  depotloc - location
                  p0 - location
                  medicine - type
                  food - type
                  carrier0 - carrier
        )
        (:init    
				  (loc depot0 depotloc)
                  (loc heli0 depotloc)
				  (empty heli0)
                  (loc carrier0 depotloc)
                  (= (used carrier0) 0)
                  (= (unused carrier0) 4)
                  (= (boxcount carrier0 medicine) 0)
                  (= (boxcount carrier0 food) 0)
                  (= (cratesUndelivered medicine depotloc) 0)
                  (= (cratesUndelivered medicine p0) 4)
                  (= (cratesUndelivered food depotloc) 0)
                  (= (cratesUndelivered food p0) 1)
        )

        (:goal    (and 
                     (= (cratesUndelivered medicine p0) 0)
                     (= (cratesUndelivered food p0) 0)
                  )
        )
)
