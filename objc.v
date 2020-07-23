module objc

#include <objc/runtime.h>
#include <objc/message.h>
#include <CoreFoundation/CoreFoundation.h>
#flag -framework Foundation

type Id voidptr
type MsgSend fn (Id, int, ...voidptr) int

// fn C.UIApplicationMain(int, ...)

fn C.objc_getClass(charptr) Id
// fn C.objc_msgSend(voidptr, charptr, ...voidptr) int
// fn C.objc_msgSend_stret(voidptr, charptr, ...voidptr) int

struct Class {
}

fn msg_send_super(a voidptr, msg string, args ...voidptr) Id {
	send := MsgSend(C.objc_msgSendSuper)
	r := send (a, charptr(msg.str), args)
	return Id(r)
}

fn get_class(klass string) Id {
	return Id(C.objc_getClass(klass.str))
}

fn msg_send(a Id, msg int, args ...voidptr) Id {
	send := MsgSend(C.objc_msgSend)
	r := send (a, msg, args) // int(charptr(msg.str)), args)
	return Id(r)
}
