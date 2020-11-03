import objc

fn main() {
	ap := objc.new_nsautorelease_pool()
	a := objc.new_nsstring('hello world')
	s := a.str()
	println('$s') // automatic .str() unwrapping
	// println('$a') // try double-free
	// b := a.append(' good bye')
	// println('$b') // automatic .str() unwrapping
// 	ap.drain()
}
