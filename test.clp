;----------Root Node----------
(defrule ask-mean-concave-points
    =>
    (printout t "Insert mean concave points : " crlf)
    (assert (concave-point-input(read)))
)
;----------Depth 1----------
(defrule ask-worst-radius
    ?valid <- (concave-point-input ?num&: (<= ?num 0.05))
    =>
    (retract ?valid)
    (printout t "Insert worst radius : " crlf)
    (assert (worst-radius-input(read)))
)

(defrule ask-worst-perimeter
    ?valid <- (concave-point-input ?num&: (> ?num 0.05))
    =>
    (retract ?valid)
    (printout t "Insert worst perimeter : " crlf)
    (assert (worst-perimeter-input(read)))
)
;----------Depth 2----------
(defrule ask-radius-error
    ?valid <- (worst-radius-input ?num&: (<= ?num 16.83))
    =>
    (retract ?valid)
    (printout t "Insert radius error :" crlf)
    (assert (radius-error-input(read)))
)

(defrule ask-mean-texture
    ?valid <- (worst-radius-input ?num&: (> ?num 16.83))
    =>
    (retract ?valid)
    (printout t "Insert mean texture :" crlf)
    (assert (mean-texture-input(read)))
)

(defrule ask-worst-texture
    ?valid <- (worst-perimeter-input ?num&: (<= ?num 114.45))
    =>
    (retract ?valid)
    (printout t "Insert worst texture :" crlf)
    (assert (worst-texture-input(read)))
)

;----------Depth 3----------
(defrule ask-worst-texture-depth-three
    ?valid <- (radius-error-input ?num&: (<= ?num 0.63))
    =>
    (retract ?valid)
    (printout t "Insert worst texture :" crlf)
    (assert (worst-texture-depth-three-input(read)))
)

(defrule ask-mean-smoothness
    ?valid <- (radius-error-input ?num&: (> ?num 0.63))
    =>
    (retract ?valid)
    (printout t "Insert mean smoothness :" crlf)
    (assert (mean-smoothness-input(read)))
)

(defrule ask-concave-point-error
    ?valid <- (mean-texture-input ?num&: (> ?num 16.19))
    =>
    (retract ?valid)
    (printout t "Insert concave points error :" crlf)
    (assert (concave-point-error-input3(read)))
)

(defrule ask-worst-concave-points
    ?valid <- (worst-texture-input ?num&: (<= ?num 25.65))
    =>
    (retract ?valid)
    (printout t "Insert worst concave points :" crlf)
    (assert (worst-concave-points-input(read)))
)

(defrule ask-perimeter-error
    ?valid <- (worst-texture-input ?num&: (> ?num 1.56))
    =>
    (retract ?valid)
    (printout t "Insert perimeter error :" crlf)
    (assert (perimeter-error-input(read)))
)

;----------Depth 4----------
(defrule ask-worst-area
    ?valid <- (worst-texture-depth-three-input ?num&: (> ?num 30.15))
    =>
    (retract ?valid)
    (printout t "Insert worst area :" crlf)
    (assert (worst-area-input(read)))
)

(defrule ask-mean-radius
    ?valid <- (perimeter-error-input ?num&: (<= ?num 13.34))
    =>
    (retract ?valid)
    (printout t "Insert mean radius :" crlf)
    (assert (mean-radius-input(read)))
)

;----------Depth 5----------
(defrule ask-mean-radius-depth-five
    ?valid <- (worst-area-input ?num&: (> ?num 641.60))
    =>
    (retract ?valid)
    (printout t "Insert mean radius :" crlf)
    (assert (mean-radius-depth-five-input(read)))
)

;----------Depth 6----------
(defrule ask-mean-texture-depth-six
    ?valid <- (mean-radius-depth-five-input ?num&: (<= ?num 13.45))
    =>
    (retract ?valid)
    (printout t "Insert mean texture :" crlf)
    (assert (mean-texture-depth-six-input(read)))
)

;----------Final Answer----------
(defrule decision_cancer
    (or (mean-texture-input ?num&: (<= ?num 16.19))
    (worst-texture-depth-three-input ?num&: (<= ?num 30.15))
    (mean-smoothness-input ?num&: (<= ?num 0.09))
    (worst-concave-points-input ?num&: (<= ?num 0.17))
    (worst-area-input ?num&: (<= ?num 641.60))
    (mean-radius-input ?num&: (> ?num 13.34))
    (mean-radius-depth-five-input ?num&: (> ?num 13.45))
    (mean-texture-depth-six-input ?num&: (> ?num 28.79))
    (concave-point-error-input3 ?num&: (> ?num 0.01)))
    =>
    (printout t "Terdeteksi kanker" crlf)
)

(defrule decision_not_cancer
    (or (worst-perimeter-input ?num&: (> ?num 114.45))
    (mean-smoothness-input ?num&: (> ?num 0.09))
    (worst-concave-points-input ?num&: (> ?num 0.17))
    (perimeter-error-input ?num&: (> ?num 1.56))
    (mean-radius-input ?num&: (<= ?num 13.34))
    (mean-texture-depth-six-input ?num&: (<= ?num 28.79))
    (concave-point-error-input3 ?num&: (<= ?num 0.01)))
    =>
    (printout t "Tidak terdeteksi kanker" crlf)
)