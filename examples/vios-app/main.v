import os
import objc.ns
import objc.uikit

#include "@VROOT/examples/vios-app/header.h"

fn main() {
	ap := ns.new_nsautorelease_pool()
	uikit.application_main(os.args, '', 'AppDelegate')
	ap.drain()
}
