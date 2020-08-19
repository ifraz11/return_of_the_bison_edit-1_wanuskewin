#import <AppKit/AppKit.h>

extern "C" {
    void rb_exit(int);
    void RubyMotionInit(int argc, char **argv);
}
int
main(int argc, char **argv)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    setenv("VM_OPT_LEVEL", "0", true);
    RubyMotionInit(argc, argv);
    NSApplication *app = [NSClassFromString(@"NSApplication") sharedApplication];
    [app setDelegate:[NSClassFromString(@"AppDelegate") new]];
    NSApplicationMain(argc, (const char **)argv);
    [pool release];
    rb_exit(0);
    return 0;
}
