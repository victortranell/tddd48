;; Deliver system

(define (domain uav-domain)
  (:requirements :typing :strips :durative-actions)
  (:types crate uav location person content object carrier num)
  (:constants
    food medicine - content
    depot - location
  )
  (:predicates
    (free ?u - uav)
    (at ?l - location ?o - object)
    (has ?o - object ?i - object)
    (needs ?p - person ?c - content)
    (next ?n0 ?n1 - num)
    (count ?carrier - carrier ?n - num)
    (path-between ?f ?t - location)
  )
  (:functions 
    (fly-duration ?from ?to - location) - number
  )
  (:durative-action drop
    :parameters(?u - uav ?l - location ?content - content ?crate - crate ?p - person)
    :duration (= ?duration 2)
    :condition (and 
                (at start (has ?u ?crate))
                (over all (at ?l ?u))
                (over all) (at ?l ?p) 
                (over all (needs ?p ?content))
                (over all (has ?crate ?content)))
    :effect (and 
      (at start (not (has ?u ?crate)))
      (at end (not (has ?crate ?content)))
      (at end (not (needs ?p ?content)))
      (at end (free ?u))
      (at end (has ?p ?content))
      (at end (at ?l ?crate))
      )
  )
  (:durative-action flyto
    :parameters(?u - uav ?f - location ?t - location)
    :duration (= ?duration (fly-duration ?f ?t))
    :condition(and (at start (at ?f ?u))
                  (over all (path-between ?f ?t)))
    :effect(and 
           (at start (not (at ?f ?u)))
           (at end (at ?t ?u))
           )
  )
  (:durative-action pickup 
    :parameters(?u - uav ?l - location ?c - crate)
    :duration (= ?duration 4)
    :condition(and 
                 (at start (free ?u))
                 (over all (at ?l ?u))
                 (over all (at ?l ?c))
                 )
    :effect(and 
           (at start (not (free ?u)))
           (at end (has ?u ?c))
           (at end (not (at ?l ?c)))
           )
  )
  (:durative-action load-crate-on-carrier
    :parameters(?u - uav ?crate - crate ?carrier - carrier ?smallercount - num ?highercount - num ?l - location)
    :duration (= ?duration 4)
    :condition(and 
                 (next ?smallercount ?highercount)
                 (has ?u ?crate)
                 (at ?l ?u)
                 (at ?l ?carrier)
                 (count ?carrier ?smallercount)
                 )
    :effect(and (count ?carrier ?highercount)
           (not (count ?carrier ?smallercount))
           (not (has ?u ?crate))
           (has ?carrier ?crate)
           (free ?u)
           )
  )
  (:durative-action unload-crate-from-carrier
    :parameters(?u - uav ?crate - crate ?carrier - carrier ?smallercount - num ?highercount - num ?l - location)
    :duration (= ?duration 2)
    :condition(and
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
           (not (count ?carrier ?highercount))
           (has ?u ?crate)
           (at ?l ?crate)
           )
  )
  (:durative-action move-carrier
    :parameters(?uav - uav ?carrier - carrier ?from - location ?to - location)
    :duration (= ?duration (fly-duration ?from ?to))
    :condition (and (at ?from ?carrier) (at ?from ?uav) (free ?uav))
    :effect(and (at ?to ?carrier)
            (not (at ?from ?carrier))
            (not (at ?from ?uav))
            (at ?to ?uav)
            (increase (total-cost) (fly-cost ?from ?to))
            )
  )
)
