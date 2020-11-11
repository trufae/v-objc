CFLAGS+=-arch arm64
# CFLAGS+=-D'nullable(x)=(void* _Nullable)(x)'

all:
	$(MAKE) vc

v:
	# issues with nullable and system() and such
	# cant be fixed with #flag or -cflags or custom header wtf
	v -os ios -cflags "$(CFLAGS)" main.v

vc:
ifeq ($(CFILE),)
	@echo Usage `make vc CFILE=foo.c`
	v -o main.c main.v
	xcrun --sdk iphoneos gcc -o main -arch arm64 main.c -lobjc -framework Foundation -framework UIKit
else
	# xcrun --sdk iphoneos gcc -Dsystem=puts -D'nullable(x)=(void* _Nullable)(x)' -arch arm64 $(CFILE) -lobjc -framework Foundation -framework UIKit 2>&1 
endif
