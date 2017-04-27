;; Deliver system

(define (domain uav-domain)
  (:requirements :typing :strips :durative-actions)
  (:types crate uav location person content object carrier num ground_robot)
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
  )
  (:functions 
    (fly-duration ?from ?to - location) - number
    (move-duration ?from ?to - location) - number
  )
  (:durative-action drop
    :parameters(?u - uav ?l - location ?content - content ?crate - crate ?p - person)
    :duration (= ?duration 2)
    :condition (and 
                (at start (has ?u ?crate))
                (over all (at ?l ?u))
                (over all (at ?l ?p))
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
    :condition(and (at start (at ?f ?u)))
    :effect(and 
           (at start (not (at ?f ?u)))
           (at end (at ?t ?u))
           )
  )
  (:durative-action moveto
    :parameters(?gr - ground_robot ?f - location ?t - location)
    :duration (= ?duration (move-duration ?f ?t))
    :condition(and (at start (at ?f ?gr)))
    :effect(and 
           (at start (not (at ?f ?gr)))
           (at end (at ?t ?gr))
           )
  )
  (:durative-action pickup 
    :parameters(?gr - ground_robot ?l - location ?c - crate)
    :duration (= ?duration 2)
    :condition(and 
                 (at start (free ?gr))
                 (over all (at ?l ?gr))
                 (at start (at ?l ?c))
                 )
    :effect(and 
           (at start (not (free ?gr)))
           (at end (has ?gr ?c))
           (at start (not (at ?l ?c)))
           )
  )
  (:durative-action load-crate-on-carrier
    :parameters(?gr - ground_robot ?crate - crate ?carrier - carrier ?smallercount - num ?highercount - num ?l - location)
    :duration (= ?duration 4)
    :condition(and 
                 (over all (next ?smallercount ?highercount))
                 (at start (has ?gr ?crate))
                 (over all (at ?l ?gr))
                 (over all (at ?l ?carrier))
                 (at start (count ?carrier ?smallercount))
                 )
    :effect(and 
           (at end (not (count ?carrier ?smallercount)))
           (at start (count ?carrier ?highercount))
           (at start (not (has ?gr ?crate)))
           (at end (has ?carrier ?crate))
           (at end (free ?gr))
           )
  )
  (:durative-action unload-crate-from-carrier
    :parameters(?u - uav ?crate - crate ?carrier - carrier ?smallercount - num ?highercount - num ?l - location)
    :duration (= ?duration 6)
    :condition(and
                 (at start (count ?carrier ?highercount))
                 (over all (next ?smallercount ?highercount))
                 (at start (has ?carrier ?crate))
                 (over all (at ?l ?u))
                 (over all (at ?l ?carrier))
                 (at start (free ?u)))
    :effect(and
           (at start (not (free ?u)))
           (at start (not (has ?carrier ?crate)))
           (at end (count ?carrier ?smallercount))
           (at start (not (count ?carrier ?highercount)))
           (at end (has ?u ?crate))
           (at end (at ?l ?crate))
           )
  )
  (:durative-action move-carrier
    :parameters(?uav - uav ?carrier - carrier ?from - location ?to - location)
    :duration (= ?duration (fly-duration ?from ?to))
    :condition (and 
                (at start (at ?from ?carrier))
                (at start (at ?from ?uav))
                (over all (free ?uav)))
    :effect(and 
            (at start (not (at ?from ?carrier)))
            (at start (not (at ?from ?uav)))
            (at end (at ?to ?carrier))
            (at end (at ?to ?uav))
            )
  )
)
