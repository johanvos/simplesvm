#import "AppDelegate.h"
// #include "hellojavafxlib.h"
int startGVM();
// extern void *JavaMainWrapper__run__5087f5482cc9a6abc971913ece43acb471d2631b();
extern void *IsolateEnterStub__JavaMainWrapper__run__5087f5482cc9a6abc971913ece43acb471d2631b__a61fe6c26e84dd4037e4629852b5488bfcc16e7e();


// void determineCPUFeatures () {
    // fprintf(stderr, "determinecpufeatures called!!\n\n\n\n\n");
// }

@interface AppDelegate ()

@end


@implementation AppDelegate

-(void)startVM:(id)selector {
    fprintf(stderr, "Starting vm...\n");
    startGVM();
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    fprintf(stderr, "UIApplication launched!\n");
    [self performSelectorInBackground:@selector(startVM:) withObject:NULL];
    fprintf(stderr, "UIApplication started GVM in a separate thread\n");
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    fprintf(stderr, "[UIAPP] applicationWillResignActive\n");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    fprintf(stderr, "[UIAPP] applicationDidEnterBackground\n");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    fprintf(stderr, "[UIAPP] applicationWillEnterForeground\n");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    fprintf(stderr, "[UIAPP] applicationDidBecomeActive\n");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    fprintf(stderr, "[UIAPP] applicationWillTerminate\n");
}


@end


int startGVM() {
    int ret;
    fprintf(stderr, "Starting GVM for ios\n");
/*
    fprintf(stderr, "Starting GVM, create isolatehread\n");
    graal_create_isolate_params_t isolate_params;
    graal_isolate_t* isolate;
    graal_isolatethread_t* isolatethread;
    ret = graal_create_isolate(&isolate_params, &isolate, &isolatethread);
    if (ret != 0) {
        fprintf(stderr, "Whoops, can't create isolate\n");
    }
*/
    // ret =  HelloEntry__callgluonentrypoint__957fc56bba4ed9a7a2d1849373316bada494979c(isolatethread, 20);
    // (*JavaMainWrapper__run__5087f5482cc9a6abc971913ece43acb471d2631b)(1);
    (*IsolateEnterStub__JavaMainWrapper__run__5087f5482cc9a6abc971913ece43acb471d2631b__a61fe6c26e84dd4037e4629852b5488bfcc16e7e)(1);

//    ret = FXEntry__runFXApp__a346e9c619a0cdb0ca82cb44b7818bf2352ab539(isolatethread, 20);
    // fprintf(stderr, "RESULT = %d\n",ret);
    // ret = graal_tear_down_isolate(isolatethread);
    
    fprintf(stderr, "Finished running GVM, done with isolatehread\n");
    return 0;
}

