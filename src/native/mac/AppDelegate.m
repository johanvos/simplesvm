#import "AppDelegate.h"
#include <pthread.h>

extern void *JavaMainWrapper__run__5087f5482cc9a6abc971913ece43acb471d2631b();
extern void *IsolateEnterStub__JavaMainWrapper__run__5087f5482cc9a6abc971913ece43acb471d2631b__a61fe6c26e84dd4037e4629852b5488bfcc16e7e();
@interface AppDelegate ()
@end

@implementation AppDelegate

-(void)startVM:(id)selector {
    NSLog(@"Starting Gluon VM...");
    pthread_t me = pthread_self();
    fprintf(stderr, "Starting on Thread: %p\n",me);
    // (*JavaMainWrapper__run__5087f5482cc9a6abc971913ece43acb471d2631b)(1);
    (*IsolateEnterStub__JavaMainWrapper__run__5087f5482cc9a6abc971913ece43acb471d2631b__a61fe6c26e84dd4037e4629852b5488bfcc16e7e)(1);
    NSLog(@"Started Gluon VM...");
}

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification  {
    pthread_t me = pthread_self();
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification  {
    pthread_t me = pthread_self();
    fprintf(stderr, "ApplicationDidFinishLaunching called, me = %p\n", me);
    [self performSelectorInBackground:@selector(startVM:) withObject:nil];
}

- (void)applicationDidFinishLaunchingWithOptions:(NSNotification *)aNotification  {
fprintf(stderr, "DIDFINISHLAUNCHING with options\n");
     [self performSelectorInBackground:@selector(startVM:) withObject:nil];
}

-(BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)app {
    return YES;
}

@end

void outBox(int argc, char** argv) {
    pthread_t me = pthread_self();
    fprintf(stderr, "in outbox, on thread %p, argc = %d and argv = %p\n", me,argc, argv);

    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    AppDelegate* appDelegate = [[AppDelegate alloc] init];
    NSApplication.sharedApplication.delegate = appDelegate;
    fprintf(stderr, "in outbox2, on thread %p\n", me);
    [NSApplication sharedApplication];

    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

    dispatch_async(dispatch_get_main_queue(), ^{
            [NSApp activateIgnoringOtherApps:YES];
        });

    fprintf(stderr, "sharedall called\n");
    [NSApp run];
    fprintf(stderr, "in outbox3, on thread %p\n", me);

    [pool release];

    fprintf(stderr, "Outbox exit now\n");
}

