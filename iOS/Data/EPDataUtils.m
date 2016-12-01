//
//  EPDataUtils.m
//  OpensslTest
//
//  Created by panelsen on 01/12/2016.
//  Copyright © 2016 panelsen. All rights reserved.
//

#import "EPDataUtils.h"

@implementation EPDataUtils
+(void)test{
    Byte byte[] = {0xb1,0x01,0x32,0xff};
    NSData *data = [[self class] convertBytesToNSData:byte];
    Byte *byte1 = [[self class] subNSDataToByte1:data range:NSMakeRange(0, 1)];
    Byte *byte2 = [[self class] subNSDataToByte2:data range:NSMakeRange(0, 1)];
    NSLog(@"");
}
#pragma mark - Hex string <-> NSString
//普通字符串转换为十六进制
+ (NSString *)convertNSStringToHexString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
//        hexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
    }
    return hexStr;
}


//十六进制转换为普通字符串的。
+ (NSString *)convertHexStringToNsString:(NSString *)hexString {
    
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:NSUTF8StringEncoding];
    return unicodeString;
}

#pragma mark - NSData <-> NSString
+(NSData *)convertNSStringToNSData:(NSString *)str{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

+(NSString *)convertNSDataToNSString:(NSData *)data{
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

#pragma mark - NSData <－> Byte
+(NSData *)convertBytesToNSData:(const void *)bytes{
    NSUInteger byteLength = sizeof(bytes);
    NSData *data = [[NSData alloc] initWithBytes:bytes length:byteLength];
    return data;
}

+(void *)convertNSDataToByte:(NSData *)data{
    Byte *bytes = (Byte *)[data bytes];
    return bytes;
}

-(void)testConvertBytesToNSData{
    Byte byte[] = {0xb1,0x01,0x32,0xff};
    NSData *data = [[self class] convertBytesToNSData:byte];
    
    Byte *bytes = [[self class] convertNSDataToByte:data];
    for(int i=0;i<[data length];i++)
        printf("testByte = %d\n",bytes[i]);
}

+(void *)subNSDataToByte1:(NSData *)data range:(NSRange)range{
    /** 另一种方式
     NSUInteger length = [data length];
     Byte *bytes = malloc(length * sizeof(unsigned char));
     [data getBytes:bytes range:range];
     */
    Byte *bytes = (Byte *)[data subdataWithRange:range].bytes;
    return bytes;
}

+(void *)subNSDataToByte2:(NSData *)data range:(NSRange)range{
     NSUInteger length = range.length;
     Byte *bytes = malloc(length * sizeof(Byte));
     [data getBytes:bytes range:range];
    
    return bytes;
}
@end
