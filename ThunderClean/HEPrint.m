//
//  HEPrint.m
//  ThunderClean
//
//  Created by He55 on 2019/6/1.
//  Copyright © 2019 He55. All rights reserved.
//

#import "HEPrint.h"

static void printf_worker(FILE *file, NSString *format, va_list arguments) {
    NSString *msg = [[NSString alloc] initWithFormat:format arguments:arguments];
    fprintf(file, "%s", [msg UTF8String]);
}

void HEPrint(NSString *format, ...) {
    va_list arguments;
    va_start(arguments, format);
    printf_worker(stdout, format, arguments);
    va_end(arguments);
}

void HEPrintln(NSString *format, ...) {
    va_list arguments;
    va_start(arguments, format);
    format = [format stringByAppendingString:@"\n"];
    printf_worker(stdout, format, arguments);
    va_end(arguments);
}

void HEFprint(FILE *file, NSString *format, ...) {
    va_list arguments;
    va_start(arguments, format);
    printf_worker(file, format, arguments);
    va_end(arguments);
}

void HEFprintln(FILE *file, NSString *format, ...) {
    va_list arguments;
    va_start(arguments, format);
    format = [format stringByAppendingString:@"\n"];
    printf_worker(file, format, arguments);
    va_end(arguments);
}
