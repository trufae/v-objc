import objc

fn test_hello_world() {
	mut a := objc.new_nsstring('hello world')
	a = a.append(' and universe')
	b := a.str()
	println('$b')
}

fn test_nsbundle() {
	nsbundle := objc.nsbundle()
	eprintln('$nsbundle')
/*
	mut a := nsbundle.main_bundle() or {
		panic(err)
	}
	println('$a')
*/
}

fn main() {
	ap := objc.new_nsautorelease_pool()

	test_hello_world()
	test_nsbundle()

	ap.drain()
}
