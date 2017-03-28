;; as defined in "logistic.pddl".

(define (problem p1-1)
  (:domain uav-domain)
  (:objects
    uav1 - uav
    p1 - person
    c1 - crate
    l1 - location
  )
  (:init
   ;; Type declarations:
   (has c1 food)
   (at depot uav1)
   (at depot c1)
   (at l1 p1)
   (needs p1 food)
   (needs p1 medicine)
   (free uav1)
  )

  ;; The goal is to have both packages delivered to their destinations:
  (:goal (and (at depot uav1)
          (has p1 food) ;; (at packet3 office1) 
     )
  )
)