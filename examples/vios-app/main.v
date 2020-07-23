import objc
import os

#flag -framework Foundation
#flag -framework UIKit
#flag -framework CoreGraphics
#include "@VROOT/examples/vios-app/header.h"
#include <CoreFoundation/CoreFoundation.h>
#include <CoreGraphics/CoreGraphics.h>

fn C.CFSTR(byteptr) objc.Id
fn C.UIApplicationMain(int, &charptr, voidptr, voidptr) int

fn main() {
	argc := os.args.len
	ap := objc.new_nsautorelease_pool()
	C.UIApplicationMain(argc, os.args, 0, C.CFSTR(c'AppDelegate'))
	ap.drain()
}
