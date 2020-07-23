import trufae.objc

fn main() {
	a := objc.new_nsstring('hello world')
	println('$a')
	a.free()
}
