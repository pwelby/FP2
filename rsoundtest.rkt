#lang racket

(require rsound)

(define CLIP-PATH "D:/Development/randomrepos/FP2/rsound-pluck-test.wav")
(define NEWSOUND-PATH "D:/Development/randomrepos/FP2/mysound-test.wav")

(define VOLUME 0.08)
(define FREQ-LOW 220)
(define FREQ-HIGH 880)
(define NUM-FRAMES 176400)


(define num-samples (rs-read-frames CLIP-PATH))
(define srate (rs-read-sample-rate CLIP-PATH))
(define duration (/ num-samples srate))

(define (sine-sweep f)
  (* VOLUME 
     (sin (* 2 pi 
             (+ FREQ-LOW (* (/ f (- 1 NUM-FRAMES)) 
                            (- FREQ-LOW FREQ-HIGH))) 
             (/ f FRAME-RATE)))))

(define mysound (build-sound NUM-FRAMES sine-sweep))

(rs-write mysound NEWSOUND-PATH)