
#include <stdio.h>
#include <CoreGraphics/CGBase.h>
#include <CoreGraphics/CoreGraphics.h>

#import <objc/runtime.h>
#import <objc/message.h>

extern void NSLog(const char *);

// This is equivalent to creating a @class with one public variable named 'window'.
struct AppDel
{
    Class isa;

    id window;
};

// This is a strong reference to the class of the AppDelegate 
// (same as [AppDelegate class])
Class AppDelClass;

typedef void *(*objc_msgSend2)(void*, void*);
typedef void *(*objc_msgSend3)(void*, void*, void*);
typedef void *(*objc_msgSend3_initWithFrame)(void*, void*, struct CGRect);
// this is the entry point of the application, same as -application:didFinishLaunchingWithOptions:
struct CGRect rect = { 0, 0, 320, 480 };
// note the fact that we use `void *` for the 'application' and 'options' fields, as we need no reference to them for this to work. A generic id would suffice here as well.
BOOL AppDel_didFinishLaunching(struct AppDel *self, SEL _cmd, void *application, void *options)
{
	NSLog(CFSTR("MAIN: finish launching Hello World"));
    objc_msgSend2 $ = objc_msgSend;
    objc_msgSend3 $3 = objc_msgSend;
    objc_msgSend3_initWithFrame $i = objc_msgSend;
    // we +alloc and -initWithFrame: our window here, so that we can have it show on screen (eventually).
    // this entire method is the objc-runtime based version of the standard View-Based application's launch code, so nothing here really should surprise you.
    // one thing important to note, though is that we use `sel_getUid()` instead of @selector().
    // this is because @selector is an objc language construct, and the application would not have been created in C if I used @selector.
    self->window = $(objc_getClass("UIWindow"), sel_getUid("alloc"));
    // self->window = $3(self->window, sel_getUid("initWithFrame:"), &rect);
    self->window = $i(self->window, sel_getUid("initWithFrame:"), rect);
NSLog(CFSTR("MAIN: Hello"));

    // here, we are creating our view controller, and our view. note the use of objc_getClass, because we cannot reference UIViewController directly in C.
    id viewController = $($(objc_getClass("UIViewController"), sel_getUid("alloc")), sel_getUid("init"));

    // creating our custom view class, there really isn't too much 
    // to say here other than we are hard-coding the screen's bounds, 
    // because returning a struct from a `objc_msgSend()` (via 
    // [[UIScreen mainScreen] bounds]) requires a different function call
    // and is finicky at best.
    id view = $3($(objc_getClass("View"), sel_getUid("alloc")), sel_getUid("initWithFrame:"), &rect);

    // here we simply add the view to the view controller, and add the viewController to the window.
    $3($(viewController, sel_getUid("view")), sel_getUid("addSubview:"), view);
    $3(self->window, sel_getUid("setRootViewController:"), viewController);

    // finally, we display the window on-screen.
    $(self->window, sel_getUid("makeKeyAndVisible"));

    return YES;
}

// note the use of the gcc attribute extension (constructor). 
// Basically, this lets us run arbitrary code before program startup,
// for more information read here: http://stackoverflow.com/questions/2053029
__attribute__((constructor))
void initAppDel()
{
    // This is objc-runtime gibberish at best. We are creating a class with the 
    // name "AppDelegate" that is a subclass of "UIResponder". Note we do not need
    // to register for the UIApplicationDelegate protocol, that really is simply for 
    // Xcode's autocomplete, we just need to implement the method and we are golden.
    AppDelClass = objc_allocateClassPair(objc_getClass("UIResponder"), "AppDelegate", 0);

    // Here, we tell the objc runtime that we have a variable named "window" of type 'id'
    class_addIvar(AppDelClass, "window", sizeof(id), 0, "@");

    // We tell the objc-runtime that we have an implementation for the method
    // -application:didFinishLaunchingWithOptions:, and link that to our custom 
    // function defined above. Notice the final parameter. This tells the runtime
    // the types of arguments received by the function.
    class_addMethod(AppDelClass, sel_getUid("application:didFinishLaunchingWithOptions:"), (IMP) AppDel_didFinishLaunching, "i@:@@");

    // Finally we tell the runtime that we have finished describing the class and 
    // we can let the rest of the application use it.
    objc_registerClassPair(AppDelClass);
}
