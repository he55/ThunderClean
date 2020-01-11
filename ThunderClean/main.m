//
//  main.m
//  ThunderClean
//
//  Created by He55 on 2019/5/12.
//  Copyright © 2019 He55. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HEPrint.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *thunderPath = @"/Applications/Thunder.app";
        NSString *thunderPluginsPath = @"/Applications/Thunder.app/Contents/PlugIns";
        NSArray<NSString *> *thunderPlugins = @[
            // @"Thunder Extension.appex",
            @"activitycenter.xlplugin",
            @"advertising.xlplugin",
            // @"applications.xlplugin",
            @"bbassistant.xlplugin",
            // @"browserhelper.xlplugin",
            // @"details.xlplugin",
            // @"diagnostic.xlplugin",
            // @"downloadhistory.xlplugin",
            @"featuredpage.xlplugin",
            @"feedback.xlplugin",
            @"iOSThunder.xlplugin",
            @"livestream.xlplugin",
            // @"liveupdate.xlplugin",
            @"myvip.xlplugin",
            @"onethingcloud.xlplugin",
            // @"preferences.xlplugin",
            // @"searchtask.xlplugin",
            @"softmanager.xlplugin",
            @"subtitle.xlplugin",
            @"thunderword.xlplugin",
            @"transfer.xlplugin",
            @"userlogin.xlplugin",
            @"viprenew.xlplugin",
            @"viptask.xlplugin",
            @"viptips.xlplugin",
            @"webgame.xlplugin",
            @"xlbrowser.xlplugin",
            @"xlplayer.xlplugin",
        ];
        
        if (![fileManager fileExistsAtPath:thunderPath]) {
            HEPrintln(@"Thunder (\"%@\") not found.", thunderPath);
            return 0;
        }
        
        HEPrintln(@"Find Thunder (\"%@\").", thunderPath);
        
        for (NSString *plugins in thunderPlugins) {
            NSString *pluginsPath = [thunderPluginsPath stringByAppendingPathComponent:plugins];
            if (![fileManager fileExistsAtPath:pluginsPath]) {
                HEPrintln(@"\"%@\" deleted.", pluginsPath);
                continue;
            }
            
            NSError *error = nil;
            if (![fileManager trashItemAtURL:[NSURL fileURLWithPath:pluginsPath] resultingItemURL:nil error:&error]) {
                HEPrintln(@"\"%@\" delete failed.", pluginsPath);
                HEPrintln(@"%@", error);
                continue;
            }
            HEPrintln(@"\"%@\" delete success.", pluginsPath);
        }
        HEPrintln(@"Done.");
    }
    return 0;
}
