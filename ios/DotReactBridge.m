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

 

/**
 * Push Message 관련 함수 
 **/  
RCT_EXPORT_METHOD(setPushToken:(NSString *)token)
{
  NSLog(@"============ setPushToken : %@================", token);
  [DOT setPushToken:token];
}

RCT_EXPORT_METHOD(setPushClick:(NSString *)clickData)
{
  NSLog(@"============ setPushClick : %@================", clickData); 
  NSData *jsonData = [clickData dataUsingEncoding:NSUTF8StringEncoding];
  NSError *e;
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:nil error:&e]; 
  [DOT setPushClick:dict];
}


/**
 * 딥링크 관련 함수.  
 **/
RCT_EXPORT_METHOD(setDeepLink:(NSString *)deepLink)
{
  NSLog(@"============ setDeepLink : %@================", deepLink);  
  [DOT setDeepLink:deepLink];
}

RCT_EXPORT_METHOD(setFacebookReferrer:(NSString *)deepLink)
{
  NSLog(@"============ setFacebookReferrer : %@================", deepLink);  
  [DOT setFacebookReferrer:deepLink];
}


/**
 * ATT 동의 관련 함수 
 **/
RCT_EXPORT_METHOD(setIDFA:(NSString *)idfa)
{
  NSLog(@"============ setIDFA : %@================", idfa);  
  [DOT setIDFA:idfa];
} 
RCT_EXPORT_METHOD(denyATT)
{
  NSLog(@"============ denyATT================");
  [DOT denyATT];
}
RCT_EXPORT_METHOD(setATTAuthorizationStatus:(NSInteger *)status)
{
  NSLog(@"============ setATTAuthorizationStatus================");
  [DOT setATTAuthorizationStatus:status];
} 


RCT_EXPORT_METHOD(setUser:(NSString *)user)
{
  NSLog(@"============ userDict : %@================", user);

  NSData *jsonData = [user dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSMutableDictionary *userDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
   
  User *userObject = [[User alloc] init];
  userObject = [self convertToDOTUser:userDict];

  NSLog(@"============ user memeber : %@================", userObject.member);
  [DOT setUser:userObject];

} 

RCT_EXPORT_METHOD(setUserLogout)
{
  [DOT setUserLogout];
} 

RCT_EXPORT_METHOD(onStartPage)
{
  NSLog(@"============ onStartPage================");
  [DOT onStartPage];
}

RCT_EXPORT_METHOD(onStopPage)
{
  NSLog(@"============ onStopPage================");
  [DOT onStopPage];
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

@end
