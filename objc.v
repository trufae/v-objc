module objc

#include <objc/runtime.h>
#include <objc/message.h>
#include <CoreFoundation/CoreFoundation.h>
#flag -framework Foundation

type Id voidptr
type Sel byteptr
type Class voidptr

type MsgSend fn (Id, Sel, ...voidptr) voidptr

// fn C.UIApplicationMain(int, ...)

fn C.objc_getClass(charptr) Class
// fn C.objc_msgSend(voidptr, charptr, ...voidptr) int
// fn C.objc_msgSend_stret(voidptr, charptr, ...voidptr) int

pub fn msg_send_super(a Id, msg string, args ...voidptr) Id {
	send := MsgSend(C.objc_msgSendSuper)
	r := send (a, charptr(msg.str), args)
	return Id(r)
}

pub fn get_class(klass string) Class {
	return Id(C.objc_getClass(klass.str))
}

pub fn msg_send(a Id, msg Sel, args ...voidptr) Id {
	send := MsgSend(C.objc_msgSend)
	r := send (a, msg, args)
	return Id(r)
}
