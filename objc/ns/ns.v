module ns

import objc


#include <CoreFoundation/CoreFoundation.h>


type NSMainBundle = voidptr
type NSAutoReleasePool = voidptr // Id
// type NSBundle = voidptr // Id
type Id = voidptr

pub type NSBundle = voidptr
// type NSBundle = C.NSBundle

/*
pub fn nsbundle() string {
	a := C.CFBundleGetMainBundle()
	return a.str()
}
*/

// nsbundle
pub fn main_bundle() ?NSMainBundle {
	r := objc.msg_send2(bundle(), objc.sel_register('mainBundle'))
	if r == 0 {
		return error('cannot retrieve the NSBundle.mainBundle')
	}
	return NSMainBundle(r)
}

pub fn bundle() NSBundle {
	return NSBundle(objc.lookup_class('NSBundle'))
}

pub fn (bundle NSMainBundle)executable_path() ?string {
	r := objc.msg_send2 (bundle, objc.sel_register('executablePath'))
	if r == 0 {
		return error('cannot retrieve the NSBundle.mainBundle.executablePath')
	}
	return NSString(r).str()
}

pub fn (bundle NSMainBundle)bundle_identifier() ?string {
	r := objc.msg_send2 (bundle, objc.sel_register('bundleIdentifier'))
	if r == 0 {
		return error('cannot retrieve the NSBundle.mainBundle.bundleIdentifier')
	}
	return NSString(r).str()
}

// autoreleasepool
pub fn (arp &NSAutoReleasePool)drain() {
	objc.msg_send2(Id(arp), objc.sel_register('drain'))
}

pub fn new_nsautorelease_pool() &NSAutoReleasePool {
	narp_klass := objc.get_class('NSAutoReleasePool')
	narp := objc.msg_send2 (narp_klass, objc.sel_register('alloc'))
	return objc.msg_send2 (narp, objc.sel_register('init'))
}

pub fn (id Id)drain() {
	objc.msg_send2(id, objc.sel_register('drain'))
}

pub fn (id Id)release() {
	objc.msg_send2(id, objc.sel_register('release'))
}

