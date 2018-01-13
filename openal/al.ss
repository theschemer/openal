;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;作者:evilbinary on 11/19/16.
;邮箱:rootdebug@163.com
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define init-path
    (lambda (dir)
        (let ([sep (if (char-ci=? (directory-separator) #\\) #\; #\:)]
              [path (or (getenv "path") "")])
            (putenv "path" (format "~a~a.~a./~a~a./lib/~a" path sep sep dir sep dir)))))
(init-path "openal")

(library (openal al)
    (export AL-LOOPING
    	AL-TRUE
    	AL-FALSE
    	AL-NONE
    	AL-BUFFER

    	al-source-i
    	al-gen-source
    	al-source-play
    	)
    (import (scheme))

    (define AL-LOOPING #x1007)
    (define AL-TRUE 1)
    (define AL-FALSE 0)
    (define AL-NONE 0)
    (define AL-BUFFER #x1009)
    
    (define lib-name
           (case (machine-type)
             ((arm32le) "libalut.so")
             ((a6nt i3nt ta6nt ti3nt)  (load-shared-object "libopenal-1.dll") "libalut.dll" )
             ((a6osx i3osx ta6osx ti3osx)  "libalut.so")
             ((a6le i3le ta6le ti3le) "libalut.so")))
                
    (define lib (load-shared-object lib-name))

    (define test (foreign-procedure "test" (int int) void ))

    (define al-source-i (foreign-procedure "alSourcei" (int int int ) void ))
    (define al-gen-source  (foreign-procedure "al_gen_source" (int ) int ) )
    (define al-source-play  (foreign-procedure "alSourcePlay" (int) void ) )
)
