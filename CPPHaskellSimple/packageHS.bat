ghc -c Foozle.hs
ghc -c HsStartEnd.c
ghc -shared -o Foozle.dll Foozle.o HsStartEnd.o
lib /DEF:Foozle.def /OUT:Foozle.lib /MACHINE:x64
