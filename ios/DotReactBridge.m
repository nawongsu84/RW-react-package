//
//  DotReactBridge.m
//  DOTPlugin
//
//  Created by Woncheol Heo on 2019. 7. 17..
//  Copyright © 2019년 Facebook. All rights reserved.
//

#import "DotReactBridge.h"
#import <React/RCTConvert.h>
#import <DOT/DOT.h>

@implementation DotReactBridge
  RCT_EXPORT_MODULE();


  RCT_EXPORT_METHOD(initialization)
  {
     dispatch_async(dispatch_get_main_queue(), ^{
       [DOT initialization:nil application:nil];
    });
  }

RCT_EXPORT_METHOD(logClick:(NSString *)click)
{
  NSLog(@"============ click : %@================", click);
  NSData *jsonData = [click dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSMutableDictionary *clickDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
  
  [DOT logClick:clickDict];
  
}

RCT_EXPORT_METHOD(logEvent:(NSString *)event)
{
  NSLog(@"============ event : %@================", event);
  NSData *jsonData = [event dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSMutableDictionary *eventDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
  
  [DOT logEvent:eventDict];
  
}

RCT_EXPORT_METHOD(logScreen:(NSString *)screen)
{
  NSLog(@"============ screen : %@================", screen);
  NSData *jsonData = [screen dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSMutableDictionary *screenDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
  
  [DOT logScreen:screenDict];
  
}

RCT_EXPORT_METHOD(logPurchase:(NSString *)puchase)
{
  NSLog(@"============ puchase : %@================", puchase);
  NSData *jsonData = [puchase dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSMutableDictionary *puchaseDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
  
  [DOT logPurchase:puchaseDict];
  
}

RCT_EXPORT_METHOD(onStartPage)
{
  NSLog(@"============ onStartWebPage================");
  [DOT onStartWebPage];
  
}

RCT_EXPORT_METHOD(setUser:(NSDictionary *)userDict)
{
  NSLog(@"============ userDict : %@================", userDict);
  
  
  User *user = [[User alloc] init];
  user = [self convertToDOTUser:userDict];
  
  NSLog(@"============ user memeber : %@================", user.member);
  [DOT setUser:user];
  
}

- (User *)convertToDOTUser:(NSDictionary *)userDict {
  
  User *user = [[User alloc] init];
  
  user.member = [RCTConvert NSString:userDict[@"mbr"]];
  user.age = [RCTConvert NSString:userDict[@"ag"]];
  user.gender = [RCTConvert NSString:userDict[@"sx"]];
  user.memberId = [RCTConvert NSString:userDict[@"mbid"]];
  user.memberGrade = [RCTConvert NSString:userDict[@"mbl"]];
  user.isLogin = [RCTConvert NSString:userDict[@"isLogin"]];
  user.attribute1 = [RCTConvert NSString:userDict[@"ut1"]];
  user.attribute2 = [RCTConvert NSString:userDict[@"ut2"]];
  user.attribute3 = [RCTConvert NSString:userDict[@"ut3"]];
  user.attribute4 = [RCTConvert NSString:userDict[@"ut4"]];
  user.attribute5 = [RCTConvert NSString:userDict[@"ut5"]];
  
  return user;
}
RCT_EXPORT_METHOD(setUserLogout)
{
  [DOT setUserLogout];
}

@end
