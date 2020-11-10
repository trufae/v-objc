module objc

#include <objc/runtime.h>
#include <objc/message.h>
#include <CoreFoundation/CoreFoundation.h>
#flag -framework Foundation

type Id = voidptr
type Sel = byteptr
type Class = voidptr

type MsgSend2 = fn (Id, Sel) voidptr
type MsgSend3 = fn (Id, Sel, Id) voidptr
type MsgSend4 = fn (Id, Sel, Id, Id) voidptr

fn C.objc_getClass(charptr) Class
fn C.objc_lookUpClass(charptr) Class
fn C.objc_getClassList(voidptr, int) int

// fn C.objc_msgSend(voidptr, charptr, ...voidptr) int
// fn C.objc_msgSend_stret(voidptr, charptr, ...voidptr) int

pub fn get_class(klass string) Class {
	return C.objc_getClass(klass.str)
	// return Id(C.objc_getClass(klass.str))
}

pub fn get_class_list(a voidptr, b int) int {
	return C.objc_getClassList(a, b)
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

pub fn lookup_class(a string) voidptr {
	return C.objc_lookUpClass(a.str)
}


/* class pair */
fn C.objc_allocateClassPair(voidptr,voidptr,voidptr) voidptr
fn C.objc_disposeClassPair(voidptr) voidptr
fn C.objc_registerClassPair(voidptr)

pub fn allocate_class_pair(a voidptr, b voidptr, c voidptr) voidptr {
	return C.objc_allocateClassPair(a, b, c)
}

pub fn dispose_class_pair(a voidptr) {
	C.objc_disposeClassPair(a)
}

pub fn register_class_pair(a voidptr) {
	C.objc_registerClassPair(a)
}

/* protocol related */

fn C.objc_getProtocol(voidptr) voidptr
fn C.objc_copyProtocolList(voidptr) voidptr
fn C.objc_allocateProtocol(voidptr) voidptr
fn C.objc_registerProtocol(voidptr)

pub fn get_protocol(a voidptr) voidptr {
	return C.objc_getProtocol(a)
}

pub fn copy_protocol_list(a voidptr) voidptr {
	return C.objc_copyProtocolList(a)
}

pub fn allocate_protocol(a voidptr) voidptr {
	return C.objc_allocateProtocol(a)
}

pub fn register_protocol(a voidptr) {
	C.objc_registerProtocol(a)
}

/*

pub fn call(path string, args []string) voidptr {
	steps := path.split('.')
	mut count := 0
	mut base := voidptr(0)
	for step in steps {
		if count == 0 {
			base =
		}
	}
}
    "objc_msgSend": function (address) {
                    this.objc_msgSend = address;
    },
    "objc_msgSend_stret": function (address) {
        this.objc_msgSend_stret = address;
    },
    "objc_msgSend_fpret": function (address) {
        this.objc_msgSend_fpret = address;
    },
    "objc_msgSendSuper": function (address) {
        this.objc_msgSendSuper = address;
    },
    "objc_msgSendSuper_stret": function (address) {
        this.objc_msgSendSuper_stret = address;
    },
    "objc_msgSendSuper_fpret": function (address) {
        this.objc_msgSendSuper_fpret = address;
    },
    "objc_getClassList": ['int', ['pointer', 'int']],
*/
