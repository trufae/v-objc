#include <objc/runtime.h>
#include <objc/message.h>
#include <CoreFoundation/CoreFoundation.h>

main() {
	size_t (*objc)(id,SEL, ...);
	objc = objc_msgSend;
	Class nsstring = objc_getClass("NSString");
	SEL stringUTF8sel = sel_registerName("stringWithUTF8String:");
	id hello = objc(nsstring, stringUTF8sel, "Hello World\n");
	char *s = (char *)objc(hello, sel_registerName("UTF8String"));
	printf ("%s\n", s);
}
