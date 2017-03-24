;; as defined in "logistic.pddl".

(define (problem p1-2)
  (:domain uav-domain)
  (:objects
    uav1 - uav
    p1 p2 - person
    c1 c2 c3 - crate
    l1 l2 - location
  )
  (:init
   ;; Type declarations:
   (has c1 food)
   (has c2 food)
   (has c3 medicine)
   (at depot uav1)
   (at depot c1)
   (at depot c2)
   (at depot c3)
   (at l1 p1)
   (at l2 p2)
   (needs p1 food)
   (needs p1 medicine)
   (needs p2 food)
   (free uav1)
  )

  ;; The goal is to have both packages delivered to their destinations:
  (:goal (and
          (at depot uav1) 
          (has p1 food) ;; (at packet3 office1) 
          (has p1 medicine)
          (has p2 food)
     )
  )
)