module objc

#include <CoreFoundation/CoreFoundation.h>


type NSAutoReleasePool = voidptr // Id
// type NSBundle = voidptr // Id

pub type NSBundle = voidptr
// type NSBundle = C.NSBundle

fn C.CFBundleGetMainBundle() NSString

// _CF.CFBundleCopyLocalizedString
// _CF.CFBundleGetMainBundle

pub fn nsbundle() string {
	a := C.CFBundleGetMainBundle()
	return a.str()
}

// nsbundle
pub fn (bundle NSBundle)main_bundle() ?string {
	r := msg_send2(bundle, sel_register('mainBundle'))
	if r == 0 {
		return error('cannot retrieve the NSBundle.mainBundle')
	}
	return tos_clone(charptr(r))
}

// autoreleasepool
pub fn (arp &NSAutoReleasePool)drain() {
	msg_send2(Id(arp), sel_register('drain'))
}

pub fn new_nsautorelease_pool() &NSAutoReleasePool {
	narp_klass := get_class('NSAutoReleasePool')
	narp := msg_send2 (narp_klass, sel_register('alloc'))
	return msg_send2 (narp, sel_register('init'))
}

pub fn (id Id)drain() {
	msg_send2(id, sel_register('drain'))
}

pub fn (id Id)release() {
	msg_send2(id, sel_register('release'))
}

