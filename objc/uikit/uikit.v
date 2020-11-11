module uikit

#flag -framework Foundation
#flag -framework UIKit
#flag -framework CoreGraphics
#include <CoreFoundation/CoreFoundation.h>
#include <CoreGraphics/CoreGraphics.h>

fn C.CFSTR(byteptr) voidptr

fn C.UIApplicationMain(int, &charptr, voidptr, voidptr) int

pub fn application_main(args []string, principal_class_name string, delegate_class_name string) {
	p := voidptr(0) // C.CFSTR(principal_class_name.str)
	d := delegate_class_name.str
	C.UIApplicationMain(args.len, args, p, d)
}
