//
//  DotReactBridge.h
//  DOTPlugin
//
//  Created by Woncheol Heo on 2019. 7. 17..
//  Copyright © 2019년 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h> 
NS_ASSUME_NONNULL_BEGIN

@interface DotReactBridge : RCTEventEmitter <RCTBridgeModule> 
-(void) emitDeferredLink:(NSString *)link;
@end

NS_ASSUME_NONNULL_END
