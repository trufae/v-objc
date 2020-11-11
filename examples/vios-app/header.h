extern void UIApplicationMain(int, ...);
#define nullable(x) (void* _Nullable)(x)
// system is not available in iOS
#define system(x) puts(x)
