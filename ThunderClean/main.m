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
        NSString *thunderPlugInsPath = @"/Applications/Thunder.app/Contents/PlugIns";
        NSArray<NSString *> *thunderPlugIns = @[
            // @"Thunder Extension.appex",
            @"activitycenter.xlplugin",
            @"advertising.xlplugin",
            // @"applications.xlplugin",
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
        
        for (NSString *plugIns in thunderPlugIns) {
            NSString *plugInsPath = [thunderPlugInsPath stringByAppendingPathComponent:plugIns];
            if (![fileManager fileExistsAtPath:plugInsPath]) {
                NSLog(@"\"%@\" 已删除。", plugInsPath);
                continue;
            }
            
            NSError *err = nil;
            BOOL result = [fileManager trashItemAtURL:[NSURL fileURLWithPath:plugInsPath] resultingItemURL:nil error:&err];
            
            if (err || !result) {
                NSLog(@"\"%@\" 删除失败。", plugInsPath);
            }
            NSLog(@"\"%@\" 删除成功。", plugInsPath);
        }
        NSLog(@"完成。");
    }
    return 0;
}
