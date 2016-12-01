//
//  EPDataUtils.h
//  OpensslTest
//
//  Created by panelsen on 01/12/2016.
//  Copyright © 2016 panelsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EPDataUtils : NSObject
+(void)test;
///-------------------------------
/// @name Hex string <-> NSString
///-------------------------------
/**
 *  Convert normal string to hex string
 */
+ (NSString *)convertNSStringToHexString:(NSString *)string;

/**
 *  Convert hex string to normal string
 */
+ (NSString *)convertHexStringToNsString:(NSString *)hexString;


///-------------------------------
/// @name NSString <-> NSData
///-------------------------------
+(NSData *)convertNSStringToNSData:(NSString *)str;
+(NSString *)convertNSDataToNSString:(NSData *)data;

///-------------------------------
/// @name NSData <-> Byte
///-------------------------------
+(NSData *)convertBytesToNSData:(const void *)bytes;
+(void *)convertNSDataToByte:(NSData *)data;
+(void *)subNSDataToByte1:(NSData *)data range:(NSRange)range;
+(void *)subNSDataToByte2:(NSData *)data range:(NSRange)range;
@end
