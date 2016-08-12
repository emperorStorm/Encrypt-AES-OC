//
//  SymmetricCryptor.m
//  encrypt
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SymmetricCryptor.h"
#import "NSString+AESCrypt.h"

#define KEY @"YKHLApiKey"
//#define APPID @"com.pengrui.cz.Cryptor"

/**
 *加密方式:
 *  key->md5加密
 *          |
 *  明文------>AES加密-->base64加密-->密文
 *
 *
 *解密方式:
 *  key------------>md5加密
 *                    |
 *  密文-->base64解密---->AES解密-->解密后的密钥
 *                                      |
 *  密文-->base64解密---------------- ------>AES解密-->明文
 */
@implementation SymmetricCryptor

//输入密钥，返回加密后的密钥
+(NSString *)getEncryptKey:(NSString *)key {
    //获取设备ID
//    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSString *identifierInLocal = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleIdentifier"];
    //拼接
    NSString *newKey = @"";
    newKey = [newKey stringByAppendingFormat:@"%@&%@",identifierInLocal, key];
    //密钥加密
    NSString *encryptKey = [newKey AES256EncryptWithKey:KEY];
    return encryptKey;
}

//输入密钥明文，返回密文
+(NSString *)inputKey:(NSString *)key WithText:(NSString *)plainText {
    NSString *encryptText = [plainText AES256EncryptWithKey:key];
    return encryptText;
}

//输入密钥密文，返回明文
+(NSString *)key:(NSString *)key WithText:(NSString *)criptText {
    //第一次解密获得解密密钥
    NSString *decryptKey = [key AES256DecryptWithKey:KEY];
    //解密密钥＝APPID＋密钥
    NSString *appId = [decryptKey componentsSeparatedByString:@"&"][0];
    NSString *cutKey = [decryptKey componentsSeparatedByString:@"&"][1];
    //获取设备ID
//    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
        NSString *identifierInLocal = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleIdentifier"];
    //验证APPID是否正确
    if (![appId  isEqual: identifierInLocal]) {
        return @"APPID错误";
    }
    //拿解密后的密钥再次解密，获取明文
    NSString *decryptText = [criptText AES256DecryptWithKey:cutKey];
    return decryptText;
}
@end
