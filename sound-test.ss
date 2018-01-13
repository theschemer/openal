(import (openal alut) (openal al))

(define file "game_bg.wav")
(alut-init)

(define buffer (alut-create-buffer-from-file file))
(define source (al-gen-source 1 ) )
(display source )
(display buffer)

(al-source-i source AL-BUFFER buffer)
(al-source-i source AL-LOOPING AL-TRUE)
(al-source-play source)

(alut-sleep 10.00)
(alut-exit)