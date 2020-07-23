import trufae.objc

fn main() {
	ap := objc.new_autorelease_pool()
	a := objc.new_nsstring('hello world')
	println('$a') // automatic .str() unwrapping
	println('$a') // try double-free
	b := a.append(' good bye')
	println('$b') // automatic .str() unwrapping
	ap.drain()
}
