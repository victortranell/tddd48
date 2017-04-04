;; Deliver system

(define (domain uav-domain)
  (:requirements :typing :strips :action-costs)
  (:types crate uav location person content object carrier num)
  (:predicates
    (free ?u - uav)
    (at ?l - location ?o - object)
    (has ?o - object ?i - object)
    (needs ?p - person ?c - content)
    (next ?n0 ?n1 - num)
    (count ?carrier - carrier ?n - num)
  )
  (:constants
    food medicine - content
    depot - location
  )
  (:functions 
    (total-cost) - number
    (fly-cost ?from ?to - location) - number
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
    :parameters(?u - uav ?f - location ?t - location)
    :precondition(at ?f ?u)
    :effect(and (not (at ?f ?u))
           (at ?t ?u)
           (increase (total-cost) (fly-cost ?f ?t))
           )
  )
  (:action pickup 
    :parameters(?u - uav ?l - location ?c - crate)
    :precondition(and (free ?u)
                 (at ?l ?u)
                 (at ?l ?c)
                 )
    :effect(and (not (free ?u))
           (has ?u ?c)
           (not (at ?l ?c))
           )
  )
  (:action load-crate-on-carrier
    :parameters(?u - uav ?crate - crate ?carrier - carrier ?smallercount - num ?highercount - num ?l - location)
    :precondition(and (next ?smallercount ?highercount)
                 (has ?u ?crate)
                 (at ?l ?u)
                 (at ?l ?carrier)
                 (count ?carrier ?smallercount)
                 )
    :effect(and (count ?carrier ?highercount)
           (not (has ?u ?crate))
           (has ?carrier ?crate)
           (free ?u)
           )
  )
  (:action unload-crate-from-carrier
    :parameters(?u - uav ?crate - crate ?carrier - carrier ?smallercount - num ?highercount - num ?l - location)
    :precondition(and
                 (count ?carrier ?highercount)
                 (next ?smallercount ?highercount)
                 (has ?carrier ?crate)
                 (at ?l ?u)
                 (at ?l ?carrier)
                 (free ?u))
    :effect(and
           (not (free ?u))
           (not (has ?carrier ?crate))
           (count ?carrier ?smallercount)
           (has ?u ?crate)
           )
  )
  (:action move-carrier
    :parameters(?carrier - carrier ?from - location ?to - location)
    :precondition(at ?from ?carrier)
    :effect(and (at ?to ?carrier)
            (not (at ?from ?carrier))
            (increase (total-cost) 1)
            )
  )
)
