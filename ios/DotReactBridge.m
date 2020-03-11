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
#import <DOX/DOX.h>

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

RCT_EXPORT_METHOD(setUserLogout)
{
  [DOT setUserLogout];
}

  RCT_EXPORT_METHOD(setClick:(NSDictionary *)clickDict)
  {
    NSLog(@"============ clickDict : %@================", clickDict);
    
    Click *click = [[Click alloc] init];
    click = [self convertToDOTClick:clickDict];
    
    NSLog(@"============ product orderAmt in Click : %lf================", ((Product *)[click.productList objectAtIndex:0]).orderAmount);
    [DOT setClick:click];
    
  }

  RCT_EXPORT_METHOD(setPurchase:(NSDictionary *)purchaseDict)
  {
    NSLog(@"============ purchaseDict : %@================", purchaseDict);
    
    
    Purchase *purchase = [[Purchase alloc] init];
    purchase = [self convertToDOTPurchase:purchaseDict];
    
    NSLog(@"============ purchase orderNo : %@================", purchase.orderNo);
    [DOT setPurchase:purchase];
    
  }

  RCT_EXPORT_METHOD(callSetUser:(NSDictionary *)userDict)
  {
    NSLog(@"============ userDict : %@================", userDict);
    
    
    User *user = [[User alloc] init];
    user = [self convertToDOTUser:userDict];
    
    NSLog(@"============ user memeber : %@================", user.member);
    [DOT setUser:user];
    
  }

  RCT_EXPORT_METHOD(callSetPage:(NSDictionary *)pageDict)
  {
    NSLog(@"============ pageDict : %@================", pageDict);
    
    
    Page *page = [[Page alloc] init];
    page = [self convertToDOTPage:pageDict];
    
    NSLog(@"============ pageDict pi : %@================", page.pi);
    [DOT setPage:page];
  }

  RCT_EXPORT_METHOD(callSetClick:(NSDictionary *)clickDict)
  {
    NSLog(@"============ clickDict : %@================", clickDict);
    
    
    Click *click = [[Click alloc] init];
    click = [self convertToDOTClick:clickDict];
    
    NSLog(@"============ product orderAmt in Click : %lf================", ((Product *)[click.productList objectAtIndex:0]).orderAmount);
    [DOT setClick:click];
  }

  RCT_EXPORT_METHOD(callStartPage)
  {
    [DOT onStartPage];
  }

  RCT_EXPORT_METHOD(callStopPage)
  {
    [DOT onStopPage];
  }

  RCT_EXPORT_METHOD(callSetPurchase:(NSDictionary *)purchaseDict)
  {
    NSLog(@"============ purchaseDict : %@================", purchaseDict);
    
    
    Purchase *purchase = [[Purchase alloc] init];
    purchase = [self convertToDOTPurchase:purchaseDict];
    
    NSLog(@"============ purchase orderNo : %@================", purchase.orderNo);
    [DOT setPurchase:purchase];
    
  }

  RCT_EXPORT_METHOD(callSetConversion :(NSDictionary *)conversionDict)
  {
    NSLog(@"============ conversionDict : %@================", conversionDict);
    
    
    Conversion *conversion = [[Conversion alloc] init];
    conversion = [self convertToDOTConversion:conversionDict];
    
    NSLog(@"============ conversion g1 : %lf================", conversion.g1);
    [DOT setConversion:conversion];
    
  }

  - (Conversion *)convertToDOTConversion:(NSDictionary *)conversionDict {
    Conversion *conversion = [[Conversion alloc] init];
    
    conversion.g1 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g1"]] doubleValue];
    conversion.g2 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g2"]] doubleValue];
    conversion.g3 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g3"]] doubleValue];
    conversion.g4 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g4"]] doubleValue];
    conversion.g5 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g5"]] doubleValue];
    conversion.g6 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g6"]] doubleValue];
    conversion.g7 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g7"]] doubleValue];
    conversion.g8 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g8"]] doubleValue];
    conversion.g9 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g9"]] doubleValue];
    conversion.g10 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g10"]] doubleValue];
    conversion.g11 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g11"]] doubleValue];
    conversion.g12 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g12"]] doubleValue];
    conversion.g13 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g13"]] doubleValue];
    conversion.g14 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g14"]] doubleValue];
    conversion.g15 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g15"]] doubleValue];
    conversion.g16 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g16"]] doubleValue];
    conversion.g17 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g17"]] doubleValue];
    conversion.g18 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g18"]] doubleValue];
    conversion.g19 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g19"]] doubleValue];
    conversion.g20 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g20"]] doubleValue];
    conversion.g21 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g21"]] doubleValue];
    conversion.g22 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g22"]] doubleValue];
    conversion.g23 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g23"]] doubleValue];
    conversion.g24 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g24"]] doubleValue];
    conversion.g25 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g25"]] doubleValue];
    conversion.g26 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g26"]] doubleValue];
    conversion.g27 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g27"]] doubleValue];
    conversion.g28 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g28"]] doubleValue];
    conversion.g29 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g29"]] doubleValue];
    conversion.g30 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g30"]] doubleValue];
    conversion.g31 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g31"]] doubleValue];
    conversion.g32 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g32"]] doubleValue];
    conversion.g33 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g33"]] doubleValue];
    conversion.g34 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g34"]] doubleValue];
    conversion.g35 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g35"]] doubleValue];
    conversion.g36 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g36"]] doubleValue];
    conversion.g37 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g37"]] doubleValue];
    conversion.g38 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g38"]] doubleValue];
    conversion.g39 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g39"]] doubleValue];
    conversion.g40 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g40"]] doubleValue];
    conversion.g41 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g41"]] doubleValue];
    conversion.g42 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g42"]] doubleValue];
    conversion.g43 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g43"]] doubleValue];
    conversion.g44 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g44"]] doubleValue];
    conversion.g45 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g45"]] doubleValue];
    conversion.g46 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g46"]] doubleValue];
    conversion.g47 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g47"]] doubleValue];
    conversion.g48 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g48"]] doubleValue];
    conversion.g49 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g49"]] doubleValue];
    conversion.g50 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g50"]] doubleValue];
    conversion.g51 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g51"]] doubleValue];
    conversion.g52 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g52"]] doubleValue];
    conversion.g53 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g53"]] doubleValue];
    conversion.g54 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g54"]] doubleValue];
    conversion.g55 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g55"]] doubleValue];
    conversion.g56 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g56"]] doubleValue];
    conversion.g57 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g57"]] doubleValue];
    conversion.g58 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g58"]] doubleValue];
    conversion.g59 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g59"]] doubleValue];
    conversion.g60 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g60"]] doubleValue];
    conversion.g61 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g61"]] doubleValue];
    conversion.g62 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g62"]] doubleValue];
    conversion.g63 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g63"]] doubleValue];
    conversion.g64 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g64"]] doubleValue];
    conversion.g65 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g65"]] doubleValue];
    conversion.g66 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g66"]] doubleValue];
    conversion.g67 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g67"]] doubleValue];
    conversion.g68 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g68"]] doubleValue];
    conversion.g69 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g69"]] doubleValue];
    conversion.g70 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g70"]] doubleValue];
    conversion.g71 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g71"]] doubleValue];
    conversion.g72 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g72"]] doubleValue];
    conversion.g73 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g73"]] doubleValue];
    conversion.g74 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g74"]] doubleValue];
    conversion.g75 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g75"]] doubleValue];
    conversion.g76 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g76"]] doubleValue];
    conversion.g77 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g77"]] doubleValue];
    conversion.g79 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g79"]] doubleValue];
    conversion.g80 = [[RCTConvert NSNumber:[conversionDict objectForKey:@"g80"]] doubleValue];
    
    NSDictionary *customValueDict = [[NSDictionary alloc] init];
    customValueDict = [RCTConvert NSDictionary:[conversionDict objectForKey:@"customValue"]];
    
    NSLog(@"============  customValueDict  : %@================", customValueDict );
    CustomValue *customValue = [[CustomValue alloc] init];
    customValue = [self makeCustomValue:customValueDict];
    [conversion setCustomValue:customValue];
    
    NSDictionary *productDict = [[NSDictionary alloc] init];
    productDict = [RCTConvert NSDictionary:[conversionDict objectForKey:@"product"]];
    
    NSLog(@"============ productDict : %@================", productDict);
    Product *product = [[Product alloc] init];
    
    product = [self makeProduct:productDict];
    [conversion setProduct:product];
    
    
    return conversion;
  }

  - (Page *)convertToDOTPage:(NSDictionary *)pageDict {
    Page *page = [[Page alloc] init];
    
    page.pi = [RCTConvert NSString:[pageDict objectForKey:@"pi"]];
    page.searchResult = [RCTConvert NSNumber:[pageDict objectForKey:@"sresultCount"]] ;
    page.contentPath = [RCTConvert NSString:[pageDict objectForKey:@"contentPath"]];
    page.keyword = [RCTConvert NSString:[pageDict objectForKey:@"keyword"]];
    page.keywordCategory = [RCTConvert NSString:[pageDict objectForKey:@"keywordCategory"]];
    
    NSDictionary *customValueDict = [[NSDictionary alloc] init];
    customValueDict = [RCTConvert NSDictionary:[pageDict objectForKey:@"customValue"]];
    
    page.customValue = [[CustomValue alloc] init];
    page.customValue = [self makeCustomValue:customValueDict];
    
    NSDictionary *productDict = [[NSDictionary alloc] init];
    productDict = [RCTConvert NSDictionary:[pageDict objectForKey:@"product"]];
    
    NSLog(@"============ productDict : %@================", productDict);
    Product *product = [[Product alloc] init];
    
    product = [self makeProduct:productDict];
    [page setProduct:product];
    
    return page;
  }

  - (Click *)convertToDOTClick:(NSDictionary *)clickDict {
    Click *click = [[Click alloc] init];
    
    //click.ckTp = [RCTConvert NSString:[clickDict objectForKey:@"ckTp"]];
    click.ckData = [RCTConvert NSString:[clickDict objectForKey:@"ckData"]];
    
    
    NSDictionary *customValueDict = [[NSDictionary alloc] init];
    customValueDict = [RCTConvert NSDictionary:[clickDict objectForKey:@"customValue"]];
    
    click.customValue = [[CustomValue alloc] init];
    click.customValue = [self makeCustomValue:customValueDict];
    
    //  NSDictionary *productDict = [[NSDictionary alloc] init];
    //  productDict = [RCTConvert NSDictionary:[clickDict objectForKey:@"product"]];
    //
    //  NSLog(@"============ productDict : %@================", productDict);
    //  Product *product = [[Product alloc] init];
    //  product = [self makeProduct:productDict];
    //  [click addCartProduct:product];
    
    NSMutableArray *productListFromRN = [[NSMutableArray alloc] init];
    NSMutableArray *productList = [[NSMutableArray alloc] init];
    productListFromRN = (NSMutableArray *)[RCTConvert NSArray:[clickDict objectForKey:@"product"]];
    
    NSLog(@"============ productListFromRN : %@================", productListFromRN);
    
    if(productListFromRN.count > 0) {
      
      productList = [self makeProductList:productListFromRN];
      
      [click addCartProductList:productList];
    }
    return click;
    
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

  - (Purchase *)convertToDOTPurchase:(NSDictionary *)purchaseDict {
    
    Purchase *purchase = [[Purchase alloc] init];
    
    purchase.orderNo = [RCTConvert NSString:[purchaseDict objectForKey:@"ordNo"]];
    purchase.currency =  [RCTConvert NSString:[purchaseDict objectForKey:@"curcy"]];
    purchase.keyword = [RCTConvert NSString:[purchaseDict objectForKey:@"skwd"]];
    purchase.keywordCategory = [RCTConvert NSString:[purchaseDict objectForKey:@"scart"]];
    purchase.useLatestIkwd = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestIkwd"]];
    purchase.useLatestMvt1 = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestMvt1"]];
    purchase.useLatestMvt2 = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestMvt2"]];
    purchase.useLatestMvt3 = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestMvt3"]];
    purchase.useLatestMvt4 = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestMvt4"]];
    purchase.useLatestMvt5 = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestMvt5"]];
    purchase.useLatestMvt6 = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestMvt6"]];
    purchase.useLatestMvt7 = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestMvt7"]];
    purchase.useLatestMvt8 = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestMvt8"]];
    purchase.useLatestMvt9 = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestMvt9"]];
    purchase.useLatestMvt10 = [RCTConvert NSString:[purchaseDict objectForKey:@"useLatestMvt10"]];;
    
    NSDictionary *customValueDict = [[NSDictionary alloc] init];
    customValueDict = [RCTConvert NSDictionary:[purchaseDict objectForKey:@"customValue"]];
    
    purchase._customValue = [[CustomValue alloc] init];
    purchase._customValue = [self makeCustomValue:customValueDict];
    
    
    //  NSDictionary *productDict = [[NSDictionary alloc] init];
    //  productDict = [RCTConvert NSDictionary:[purchaseDict objectForKey:@"product"]];
    //
    //  NSLog(@"============ product count : %ld================", [((NSDictionary *)[purchaseDict objectForKey:@"product"]) count]);
    //  NSLog(@"============ product : %@================", ((NSDictionary *)[purchaseDict objectForKey:@"product"]));
    //  Product *product = [[Product alloc] init];
    //
    //  product = [self makeProduct:productDict];
    //  [purchase setProduct:product];
    
    
    NSMutableArray *productListFromRN = [[NSMutableArray alloc] init];
    NSMutableArray *productList = [[NSMutableArray alloc] init];
    productListFromRN = (NSMutableArray *)[RCTConvert NSArray:[purchaseDict objectForKey:@"product"]];
    
    
    if(productListFromRN.count > 0) {
      NSLog(@"============ productListFromRN : %@================", productListFromRN);
      
      productList = [self makeProductList:productListFromRN];
      
      [purchase setProductList:productList];
    }
    return purchase;
  }

  - (CustomValue *)makeCustomValue:(NSDictionary *)customValueDict {
    CustomValue *customValue = [[CustomValue alloc] init];
    
    if(![[customValueDict objectForKey:@"mvt1"] isEqualToString:@""]) {
      customValue.value1 =  [customValueDict objectForKey:@"mvt1"];
    }
    
    if(![[customValueDict objectForKey:@"mvt2"] isEqualToString:@""]) {
      customValue.value2 =  [customValueDict objectForKey:@"mvt2"];
    }
    if(![[customValueDict objectForKey:@"mvt3"] isEqualToString:@""]) {
      customValue.value3 =  [customValueDict objectForKey:@"mvt3"];
    }
    if(![[customValueDict objectForKey:@"mvt4"] isEqualToString:@""]) {
      customValue.value5 =  [customValueDict objectForKey:@"mvt4"];
    }
    if(![[customValueDict objectForKey:@"mvt5"] isEqualToString:@""]) {
      customValue.value6 =  [customValueDict objectForKey:@"mvt5"];
    }
    if(![[customValueDict objectForKey:@"mvt6"] isEqualToString:@""]) {
      customValue.value1 =  [customValueDict objectForKey:@"mvt6"];
    }
    if(![[customValueDict objectForKey:@"mvt7"] isEqualToString:@""]) {
      customValue.value7 =  [customValueDict objectForKey:@"mvt7"];
    }
    if(![[customValueDict objectForKey:@"mvt8"] isEqualToString:@""]) {
      customValue.value8 =  [customValueDict objectForKey:@"mvt8"];
    }
    if(![[customValueDict objectForKey:@"mvt9"] isEqualToString:@""]) {
      customValue.value9 =  [customValueDict objectForKey:@"mvt9"];
    }
    if(![[customValueDict objectForKey:@"mvt10"] isEqualToString:@""]) {
      customValue.value10 =  [customValueDict objectForKey:@"mvt10"];
    }
    return customValue;
    
  }
  - (Product *)makeProduct:(NSDictionary *)productDict {
    Product *product = [[Product alloc] init];
    
    if(![[productDict objectForKey:@"pnc"] isEqualToString:@""]) {
      product.productCode = [productDict objectForKey:@"pnc"];
    }
    
    if(![[productDict objectForKey:@"pnAtr1"] isEqualToString:@""]) {
      product.attribute1 = [productDict objectForKey:@"pnAtr1"];
    }
    if(![[productDict objectForKey:@"pnAtr2"] isEqualToString:@""]) {
      product.attribute2 = [productDict objectForKey:@"pnAtr2"];
    }
    if(![[productDict objectForKey:@"pnAtr3"] isEqualToString:@""]) {
      product.attribute3 = [productDict objectForKey:@"pnAtr3"];
    }
    if(![[productDict objectForKey:@"pnAtr4"] isEqualToString:@""]) {
      product.attribute4 = [productDict objectForKey:@"pnAtr4"];
    }
    if(![[productDict objectForKey:@"pnAtr5"] isEqualToString:@""]) {
      product.attribute5 = [productDict objectForKey:@"pnAtr5"];
    }
    if(![[productDict objectForKey:@"pnAtr6"] isEqualToString:@""]) {
      product.attribute6 = [productDict objectForKey:@"pnAtr6"];
    }
    if(![[productDict objectForKey:@"pnAtr7"] isEqualToString:@""]) {
      product.attribute7 = [productDict objectForKey:@"pnAtr7"];
    }
    if(![[productDict objectForKey:@"pnAtr8"] isEqualToString:@""]) {
      product.attribute8 = [productDict objectForKey:@"pnAtr8"];
    }
    if(![[productDict objectForKey:@"pnAtr9"] isEqualToString:@""]) {
      product.attribute9 = [productDict objectForKey:@"pnAtr9"];
    }
    if(![[productDict objectForKey:@"pnAtr10"] isEqualToString:@""]) {
      product.attribute10 = [productDict objectForKey:@"pnAtr10"];
    }
    if(![[productDict objectForKey:@"pg1"] isEqualToString:@""]) {
      product.firstCategory = [productDict objectForKey:@"pg1"];
    }
    if(![[productDict objectForKey:@"pg2"] isEqualToString:@""]) {
      product.secondCategory = [productDict objectForKey:@"pg2"];
    }
    if(![[productDict objectForKey:@"pg3"] isEqualToString:@""]) {
      product.thirdCategory = [productDict objectForKey:@"pg3"];
    }
    if(![[productDict objectForKey:@"pg4"] isEqualToString:@""]) {
      product.detailCategory = [productDict objectForKey:@"pg4"];
    }
    
    NSLog(@"=============  orderAmount : %@ ================", [productDict objectForKey:@"orderAmount"]);
    if([productDict objectForKey:@"amt"] != NULL) {
      product.orderAmount = [[productDict objectForKey:@"amt"] doubleValue];
    }
    
    if([productDict objectForKey:@"ea"] != NULL) {
      product.orderQuantity = [[productDict objectForKey:@"ea"] integerValue];
    }
    
    if([productDict objectForKey:@"rfnd"] != NULL) {
      product.refundAmount = [[productDict objectForKey:@"rfnd"] doubleValue];
    }
    
    if([productDict objectForKey:@"rfea"] != NULL) {
      product.refundQuantity = [[productDict objectForKey:@"rfea"] integerValue];
    }
    
    product.productOrderNo = [productDict objectForKey:@"productOrderNo"];
    product.optAmt = (NSMutableDictionary *)[productDict objectForKey:@"optAmt"];
    
    return product;
  }

  - (NSMutableArray *)makeProductList:(NSMutableArray *)productListFromRN {
    NSMutableArray *productList = [[NSMutableArray alloc] init];
    
    
    for(NSInteger i = 0; i < productListFromRN.count; i++) {
      Product *product = [[Product alloc] init];
      
      product.productCode = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnc"];
      product.attribute1 = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnAtr1"];
      product.attribute2 = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnAtr2"];
      product.attribute3 = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnAtr3"];
      product.attribute4 = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnAtr4"];
      product.attribute5 = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnAtr5"];
      product.attribute6 = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnAtr6"];
      product.attribute7 = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnAtr7"];
      product.attribute8 = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnAtr8"];
      product.attribute9 = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnAtr9"];
      product.attribute10 = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pnAtr10"];
      product.firstCategory = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pg1"];
      product.secondCategory = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pg2"];
      product.thirdCategory = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pg3"];
      product.detailCategory = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"pg4"];
      product.orderAmount = [[(NSDictionary *) [productListFromRN objectAtIndex:i] objectForKey:@"amt"] doubleValue];
      product.orderQuantity = [[(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"ea"] integerValue];
      product.refundAmount = [[(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"rfnd"] doubleValue];
      product.refundQuantity = [[(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"rfea"] integerValue];;
      product.productOrderNo = [(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"ordPno"];
      product.optAmt = (NSMutableDictionary *)[(NSDictionary *)[productListFromRN objectAtIndex:i] objectForKey:@"optAmt"];
      
      NSLog(@"================product orderAmount: %lf========================", product.orderAmount);
      [productList addObject:product];
    }
    
    return productList;
  }

//DOX Bridge 함수

RCT_EXPORT_METHOD(userIdentify:(NSString *)userIdentify)
{
  NSLog(@"============ userIdentify : %@================", userIdentify);
  NSData *jsonData = [userIdentify dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSMutableDictionary *userIdentifyDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
  
  [DOX userIdentifyWith:userIdentifyDict];
}

RCT_EXPORT_METHOD(groupIdentify:(NSString *)groupIdentify)
{
  NSLog(@"============ groupIdentify : %@================", groupIdentify);
  
  NSData *jsonData = [groupIdentify dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSMutableDictionary *groupIdentifyDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
  
  NSDictionary *groups = (NSDictionary *)[groupIdentifyDict objectForKey:@"groups"];
  NSDictionary *groupproperties = (NSDictionary *)[groupIdentifyDict objectForKey:@"groupproperties"];
  
  [DOX groupIdentifyWith:groups identify:groupproperties];
}


RCT_EXPORT_METHOD(logXEvent:(NSString *)event)
{
  NSLog(@"============ event : %@================", event);
  NSData *jsonData = [event dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSMutableDictionary *eventDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
  
  [DOX logEventWith:eventDict];
}

RCT_EXPORT_METHOD(logXConversion:(NSString *)conversion)
{
  NSLog(@"============ conversion : %@================", conversion);
  NSData *jsonData = [conversion dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSMutableDictionary *conversionDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
  [DOX logConversionWith:conversionDict];
}

RCT_EXPORT_METHOD(logXPurchase:(NSString *)purchase)
{
  NSLog(@"============ purchase : %@================", purchase);
  NSData *jsonData = [purchase dataUsingEncoding:NSUTF8StringEncoding];
  NSError *error;
  NSMutableDictionary *purchseDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
  
  [DOX logRevenueWith:purchseDict];
}

@end
