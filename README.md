# Final Project Assignment 2: Explore One More! (FP2)
DUE March 30, 2015 Monday (2015-03-30)

### My Library: rsound

In this second exploration, I decided to familiarize myself with the rsound library, which provides a suite of useful abstractions for reading and manipulating sound data.
I decided to write a small two-part demonstration.

The full code is as follows:  
```
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
```

The first part works a bit with the file reading procedures given in the rsound library. The `rs-read-frames` and `rs-read-sample-rate` procedures both read data from the header of a WAV file. Using the two in conjunction, the duration of the sound file in seconds can be determined. After defining the bindings above, we can query the interpreter for the value of duration with the following result:
```
> duration
2 1/2
```
This is indeed the duration of the [test sound file][Duration-Test-Sound] I had made.

The second part of the demo builds a simple sound using the `build-sound` procedure and my own `sine-sweep` procedure to generate values for each sample. As my sample generator's name suggests, the generated sound is a simple sine wave which sweeps linearly from the frequency `FREQ-LOW` to `FREQ-HIGH` over a duration of `NUM-FRAMES` samples.
*Note: The FRAME-RATE constant is provided by rsound, and has a value of 44100, a typical default number of samples per second.*

Once the sound has been built, it is written to a file at `NEWSOUND-PATH`.

The resulting WAV file is available [here][Sound-File-Output].

[Duration-Test-Sound]: https://soundcloud.com/pwelby/rsound-pluck-test
[Sound-File-Output]: https://soundcloud.com/pwelby/mysound-test
