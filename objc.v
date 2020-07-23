module objc

#include <objc/runtime.h>
#include <objc/message.h>
#include <CoreFoundation/CoreFoundation.h>
#flag -framework Foundation

type Id voidptr
type Sel byteptr
type Class voidptr

type MsgSend2 fn (Id, Sel) voidptr
type MsgSend3 fn (Id, Sel, Id) voidptr
type MsgSend4 fn (Id, Sel, Id, Id) voidptr

// fn C.UIApplicationMain(int, ...)

fn C.objc_getClass(charptr) Class
// fn C.objc_msgSend(voidptr, charptr, ...voidptr) int
// fn C.objc_msgSend_stret(voidptr, charptr, ...voidptr) int

pub fn get_class(klass string) Class {
	return Id(C.objc_getClass(klass.str))
}

pub fn msg_send4(a Id, msg Sel, arg Id, arg2 Id) Id {
	send := MsgSend4(C.objc_msgSend)
	return send (a, msg, arg, arg2)
}

pub fn msg_send3(a Id, msg Sel, arg Id) Id {
	send := MsgSend3(C.objc_msgSend)
	return send (a, msg, arg)
}

pub fn msg_send2(a Id, msg Sel) Id {
	send := MsgSend2(C.objc_msgSend)
	return send (a, msg)
}
