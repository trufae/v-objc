import objc

fn main() {
	ap := objc.new_nsautorelease_pool()
	mut a := objc.new_nsstring('hello world')
	a = a.append(' and universe')
	b := a.str()
	println('$b')
	ap.drain()
}
