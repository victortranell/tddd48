(define (domain uav-domain)
  (:requirements :typing :strips)
  (:types crate uav location person content object)
  (:predicates  (free ?u - uav)
                (at ?l - location ?o - object)
                (has ?o ?i - object)
                (needs ?p - person ?c - content))
  (:constants
    food medicine - content
    depot - location
  )
  ; (:action drop
  ;   :parameters(?u - uav ?l - location ?c - content ?k - crate ?p - person)
  ;   :precondition (and (has ?u ?k) (at ?l ?u) (at ?l ?p) (needs ?p ?c) (has ?k ?c))
  ;   :effect (and (not (has ?u ?c))
  ;     (not (needs ?p ?c))
  ;     (free ?u)
  ;     (has ?p ?c)
  ;     (at ?l ?c)
  ;     )
  ; )
  (:action flyto
    :parameters (?u - uav ?f - location ?t - location)
    :precondition (at ?f ?u)
    :effect (and (not (at ?f ?u)) (at ?t ?u))
  )
  ;(:action pickup 
  ;  :parameters(?u - uav ?l - location ?c - crate)
  ;  :precondition (and (free ?u)
  ;                (at ?l ?u)
  ;                (at ?l ?c)
  ;                )
  ;  :effect (and (not (free ?u))
  ;           (has ?u ?c)
  ;           (not (at ?l ?c))
  ;           )
  ; )
)
