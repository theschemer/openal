(("name" . "sound")
("version" . "0.0.2")
("description" . "")
("keywords")
("author" 
    ("evilbinary" "ch"))
("document". "http://distro.ibiblio.org/rootlinux/rootlinux-ports/more/freealut/freealut-1.1.0/doc/alut.html")
("private" . #t)
("scripts" 
    ("run" . "scheme32 --script")
    ("build" . "cd libault && make && make clean"))
("dependencies")
("devDependencies"))