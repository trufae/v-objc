all:
	xcrun --sdk iphoneos gcc -arch arm64 -framework UIKit -framework Foundation -framework CoreGraphics *.c
	ldid2 -S a.out
	scp a.out root@192.168.1.165:/tmp
