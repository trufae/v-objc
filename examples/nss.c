#include <objc/runtime.h>
#include <objc/message.h>
#include <CoreFoundation/CoreFoundation.h>

main() {
#if 0
	objc = objc_msgSend;
	Class nsstring = objc_getClass("NSString");
	SEL stringUTF8sel = sel_registerName("stringWithUTF8String:");
	id hello = objc(nsstring, stringUTF8sel, "Hello World\n");
	char *s = (char *)objc(hello, sel_registerName("UTF8String"));
	printf ("%s\n", s);
#else
	void *(*objc)(void*,void*, ...);
	objc = objc_msgSend;
	void *nsstring = objc_getClass("NSString");
	void *stringUTF8sel = sel_registerName("stringWithUTF8String:");
	void *hello = objc(nsstring, stringUTF8sel, "Hello World\n");
	char *s = (char *)objc(hello, sel_registerName("UTF8String"));
	printf ("%s\n", s);
#endif
}
