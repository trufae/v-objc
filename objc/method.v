module objc

type Method = voidptr


fn C.method_getName(Method) Selector
/*
    "method_getName": ['pointer', ['pointer']],
    "method_getTypeEncoding": ['pointer', ['pointer']],
    "method_getImplementation": ['pointer', ['pointer']],
    "method_setImplementation": ['pointer', ['pointer', 'pointer']],
*/
