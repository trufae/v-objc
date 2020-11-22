#include <CoreFoundation/CoreFoundation.h>

#include <objc/runtime.h>
#include <objc/message.h>
#include <CoreGraphics/CGGeometry.h>
#include <CoreGraphics/CGContext.h>

// This is a hack. Because we are writing in C, we cannot out and include 
// <UIKit/UIKit.h>, as that uses Objective-C constructs.
// however, neither can we give the full function declaration, like this:
// int UIApplicationMain (int argc, char *argv[], NSString *principalClassName, NSString *delegateClassName);
// So, we rely on the fact that for both the i386 & ARM architectures, 
// the registers for parameters passed in remain the same whether or not 
// you are using VA_ARGS. This is actually the basis of the objective-c 
// runtime (objc_msgSend), so we are probably fine here,  this would be
// the last thing I would expect to break.
extern int UIApplicationMain(int, void*, void*, void *);
extern int UIApplicationMain(int, void*, void*, void *);
extern void *UIGraphicsGetCurrentContext();
// extern void CGContextMoveToPoint(void*, int, int);
// extern void CGContextAddLineToPoint(void*, int, int);
// typedef void* CGContextRef;

extern void NSLog(const char *);

typedef void *(*objc_msgSend2)(void*, void*);
typedef void *(*objc_msgSend3)(void*, void*, void*);

// Entry point of the application. If you don't know what this is by now, 
// then you probably shouldn't be reading the rest of this post.
int main(int argc, char *argv[])
{
	NSLog(CFSTR("MAIN: Hello World"));
    objc_msgSend2 $ = objc_msgSend;
    objc_msgSend3 $3 = objc_msgSend;
    // Create an @autoreleasepool, using the old-stye API. 
    // Note that while NSAutoreleasePool IS deprecated, it still exists 
    // in the APIs for a reason, and we leverage that here. In a perfect 
    // world we wouldn't have to worry about this, but, remember, this is C.
    void *klass = objc_getClass("NSAutoreleasePool");
    void *pool = $(klass, sel_registerName("alloc"));
    id autoreleasePool = $(pool, sel_registerName("init"));

    // Notice the use of CFSTR here. We cannot use an objective-c string 
    // literal @"someStr", as that would be using objective-c, obviously.
void *nss = objc_getClass("NSString");
void *init = sel_registerName("stringWithUTF8String:");
void *nsadn = $3(nss, init, "AppDelegate");
    UIApplicationMain(argc, argv, nil, CFSTR("AppDelegate"));

void *v = objc_getClass("View");
  CGFloat components[] = {1.0, 0.0, 0.0, 1.0};
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorspace, components);
CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color);
CGContextMoveToPoint(context, 30, 30);
CGContextAddLineToPoint(context, 300, 400);
$(v, "setNeedsDisplay");

// CGContextSetLineWidth(context, 2.0);




    $(autoreleasePool, sel_registerName("drain"));
}
