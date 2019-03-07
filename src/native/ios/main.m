//
//  main.m
//  svmsim
//
//  Created by Johan on 19/12/2018.
//  Copyright © 2018 Johan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include <dirent.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
/*
double StrictMath_asin (double b) {
    fprintf(stderr, "[JVDBG] MATH asked\n");
    return 1.;
}

double StrictMath_acos (double b) {
    fprintf(stderr, "[JVDBG] MATH asked\n");
    return 1.;
}
double StrictMath_atan2 (double b) {
    fprintf(stderr, "[JVDBG] MATH asked\n");
    return 1.;
}

double StrictMath_exp (double b) {
    fprintf(stderr, "[JVDBG] MATH asked\n");
    return 1.;
}

double StrictMath_hypot (double b) {
    fprintf(stderr, "[JVDBG] MATH asked\n");
    return 1.;
}

double StrictMath_pow (double a, double b) {
    fprintf(stderr, "[JVDBG] MATH asked\n");
    return 1.;
}
double StrictMath_cbrt (double b) {
    fprintf(stderr, "[JVDBG] MATH asked\n");
    return 1.;
}
*/

void inflateStart() {
    fprintf(stderr, "[JVDBG] INFLATE asked\n");
}

void inflateInit2_() {
    fprintf(stderr, "[JVDBG] INFLATE asked\n");
}
void inflateEnd() {
    fprintf(stderr, "[JVDBG] INFLATE asked\n");
}

void inflate() {
    fprintf(stderr, "[JVDBG] INFLATE asked\n");
}
void inflateReset() {
    fprintf(stderr, "[JVDBG] INFLATE asked\n");
}


struct dirent* readdir_r$INODE64(DIR *dirp) {
    NSLog(@"%@", [NSThread callStackSymbols]);
    
    //  [NSThread callStackSymbols];
    fprintf(stderr, "[JVDBG] readdir asked\n");
    return readdir(dirp);
}

DIR* opendir$INODE64(const char* dirname) {
    NSLog(@"%@", [NSThread callStackSymbols]);
    
    fprintf(stderr, "[JVDBG] opendir asked\n");
    return opendir(dirname);
}
