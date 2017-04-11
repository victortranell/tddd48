(define (domain simplerover2)
    (:requirements :typing :durative-actions)
    (:types rover location data - object)
    (:predicates
        (at ?rover - rover ?location - location)
        (acquired ?rover - rover ?d - data)
        (sent ?d - data)
        (path-between ?a ?u - location)
        (free-to-send ?r - rover))
    
    (:durative-action drive
        :parameters (?r - rover ?from ?to - location)
        :duration (= ?duration 10)
        :condition (and (at start (at ?r ?from))
                        (over all (path-between ?from ?to)))
        :effect (and 
                   (at start (not (at ?r ?from)))
                   (at end (at ?r ?to))))

    (:durative-action send
        :parameters (?r - rover ?d - data ?loc - location)
        :duration (= ?duration 2)
        :condition (and (over all (acquired ?r ?d))
                     (over all (at ?r ?loc))
                     (at start (free-to-send ?r)))
        :effect (and (at end (sent ?d))
                    (at start (not (free-to-send ?r)))
                    (at end (free-to-send ?r)))
    )
)