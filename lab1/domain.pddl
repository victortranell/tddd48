;; Deliver system

(define (domain DeliverSystem)
  (:requirements :typing :strips)
  (:predicates
    (carrying ?u - uav ?c - content)
    (free ?u - uav)
    (at ?l - location ?o - object)
    (has ?p - person ?c - content)
    (needs ?p - person ?c - content)
  )
  (:types crate uav content location person)
  (:constants
    food medicine - content
    depot - location
  )

  (:action drop
    :parameters(?u - uav ?l - location ?c - content ?p - person)
    :precondition (and carrying(?u ?c) at(?l ?u) at(?l ?p) needs(?p ?c))
    :effect (and (not carrying(?u ?c)) 
      (not needs(?p ?c))
      free(?u)
      )
  )

  (:action flyto
    :parameters(?u - uav ?f - location ?t - location ?c - content)
    :precondition (and at(?f ?u) at(?f ?c))
    :effect (and (not at(?f ?u)) 
      (not at(?f ?c)) 
      at(?t ?c)
      at(?t ?u)
      )
  )

  (:action pickup 
    :parameters(?u - uav ?l - location ?c - content)
    :precondition (and free(?u)
                  at(?l ?u)
                  at(?l ?c)
                  )
    :effect (and (not free(?u))
            carrying(?u ?c)
            )
  )
)
