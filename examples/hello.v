import objc
import objc.ns

fn test_hello_world() {
	mut a := ns.new_nsstring('hello world')
	a = a.append(' and universe')
	b := a.str()
	println('$b')
}

fn test_nsbundle()? {
	main_bundle := ns.main_bundle()?
	bundle_id := main_bundle.bundle_identifier() or { '' }
	exec_path := main_bundle.executable_path()?
	// nsbundle := objc.nsbundle()
	eprintln('bundle_id: $bundle_id')
	eprintln('exec_path: $exec_path')
/*
	mut a := nsbundle.main_bundle() or {
		panic(err)
	}
	println('$a')
*/
}

fn main() {
	ap := ns.new_nsautorelease_pool()

	test_hello_world()
	test_nsbundle()?

	ap.drain()
}
