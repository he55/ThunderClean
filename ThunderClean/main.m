//
//  main.m
//  ThunderClean
//
//  Created by He55 on 2019/5/12.
//  Copyright © 2019 He55. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *thunderPath = @"/Applications/Thunder.app";
        NSString *thunderPluginsPath = @"/Applications/Thunder.app/Contents/PlugIns";
        NSArray<NSString *> *thunderPlugins = @[// @"Thunder Extension.appex",
                                                @"activitycenter.xlplugin",
                                                @"advertising.xlplugin",
                                                // @"applications.xlplugin",
                                                @"bbassistant.xlplugin",
                                                // @"browserhelper.xlplugin",
                                                // @"details.xlplugin",
                                                @"featuredpage.xlplugin",
                                                @"feedback.xlplugin",
                                                @"iOSThunder.xlplugin",
                                                @"livestream.xlplugin",
                                                // @"liveupdate.xlplugin",
                                                @"lixianspace.xlplugin",
                                                @"myvip.xlplugin",
                                                // @"preferences.xlplugin",
                                                // @"searchtask.xlplugin",
                                                @"softmanager.xlplugin",
                                                @"subtitle.xlplugin",
                                                @"thunderword.xlplugin",
                                                @"userlogin.xlplugin",
                                                @"viprenew.xlplugin",
                                                @"viptask.xlplugin",
                                                @"viptips.xlplugin",
                                                @"xiazaibao.xlplugin",
                                                @"xlbrowser.xlplugin",
                                                @"xlplayer.xlplugin"];
        
        if (![fileManager fileExistsAtPath:thunderPath]) {
            NSLog(@"没有找到迅雷。");
            return 0;
        }
        
        for (NSString *plugins in thunderPlugins) {
            NSString *pluginsPath = [thunderPluginsPath stringByAppendingPathComponent:plugins];
            if (![fileManager fileExistsAtPath:pluginsPath]) {
                NSLog(@"\"%@\" 已删除。", pluginsPath);
                continue;
            }
            
            NSError *error = nil;
            if (![fileManager trashItemAtURL:[NSURL fileURLWithPath:pluginsPath] resultingItemURL:nil error:&error]) {
                NSLog(@"\"%@\" 删除失败。", pluginsPath);
                NSLog(@"%@", error);
                continue;
            }
            NSLog(@"\"%@\" 删除成功。", pluginsPath);
        }
        NSLog(@"完成。");
    }
    return 0;
}
