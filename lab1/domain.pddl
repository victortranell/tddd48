;; Deliver system

(define (domain uav-domain)
  (:requirements :typing :strips)
  (:types crate uav location person content object)
  (:constants
    food medicine - content
    depot - location
  )
  (:predicates
    (free ?u - uav)
    (at ?l - location ?o - object)
    (has ?o - object ?i - object)
    (needs ?p - person ?c - content)
  )
  (:action drop
    :parameters(?u - uav ?l - location ?c - content ?k - crate ?p - person)
    :precondition (and (has ?u ?k) (at ?l ?u) (at ?l ?p) (needs ?p ?c) (has ?k ?c))
    :effect (and (not (has ?u ?c))
      (not (needs ?p ?c))
      (free ?u)
      (has ?p ?c)
      (at ?l ?c)
      )
  )
  (:action flyto
    :parameters(?u - uav ?f - location ?t - location ?c - crate)
    :precondition (and (at ?f ?u) (at ?f ?c) (has ?u ?c))
    :effect (and (not (at ?f ?u))
      (not (at ?f ?c))
      (at ?t ?u)
      )
  )
  (:action pickup 
    :parameters(?u - uav ?l - location ?c - crate)
    :precondition (and (free ?u)
                  (at ?l ?u)
                  (at ?l ?c)
                  )
    :effect (and (not (free ?u))
            (has ?u ?c)
            (not (at ?l ?c))
            )
  )
)
