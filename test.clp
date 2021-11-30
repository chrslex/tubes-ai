(deffacts start 
    (amcp)
)

;----------Root Node----------
(defrule ask-mean-concave-points
    ?val <- (amcp)
    =>
    (retract ?val)
    (printout t "Insert mean concave points : ")
    (assert concave-point-input(read))
)
;----------Depth 1----------
(defrule ask-worst-radius
    ?valid <- (concave-point-input ?num&: (<= ?num 0.05))
    =>
    (retract ?valid)
    printout( t "Insert worst radius : ")
    (assert worst-radius-input(read))
)

(defrule ask-worst-perimeter
    ?valid <- (concave-point-input ?num&: (> ?num 0.05))
    =>
    (retract ?valid)
    (printout t "Insert worst perimeter : ")
    (assert worst-perimeter-input(read))
)
;----------Depth 2----------
(defrule ask-radius-error
    ?valid <- (worst-radius-input ?num&: (<= ?num 16.83))
    =>
    (retract ?valid)
    (printout t "Insert radius error :")
    (assert radius-error-input(read))
)

(defrule ask-mean-texture
    ?valid <- (worst-radius-input ?num&: (> ?num 16.83))
    =>
    (retract ?valid)
    (printout t "Insert mean texture :")
    (assert radius-error-input(read))
)

(defrule ask-worst-texture
    ?valid <- (worst-perimeter-input ?num&: (<= ?num 114.45))
    =>
    (retract ?valid)
    (printout t "Insert worst texture :")
    (assert radius-error-input(read))
)

; Masih bingung ini endingnya harus diapain untuk yang depth 2 tapi udah ke diagnose duluan dari yang lain.
(defrule predicted
    ?valid <- (worst-perimeter-input ?num&: (> ?num 114.45))
    =>
    (retract ?valid)
)

;----------------Diagnose----------------