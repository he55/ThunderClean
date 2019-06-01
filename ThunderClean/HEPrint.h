//
//  HEPrint.h
//  ThunderClean
//
//  Created by He55 on 2019/6/1.
//  Copyright © 2019 He55. All rights reserved.
//

#import <Foundation/Foundation.h>

extern void HEPrint(NSString *format, ...);
extern void HEPrintln(NSString *format, ...);
extern void HEFprint(FILE *file, NSString *format, ...);
extern void HEFprintln(FILE *file, NSString *format, ...);
