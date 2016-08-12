//
//  SymmetricCryptor.h
//  encrypt
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//
/**
 *加密方式:
 *  key->md5加密
 *          |
 *  明文------>AES加密-->base64加密-->密文
 *
 *
 *解密方式:plainText
 *  key------------>md5加密
 *                    |
 *  密文-->base64解密---->AES解密-->解密后的密钥
 *                                      |
 *  密文-->base64解密----------------------->AES解密-->明文
 */

#import <Foundation/Foundation.h>
@interface SymmetricCryptor : NSObject
+ (NSString *)getEncryptKey:(NSString *)key;
/*
 参数：
    1.加密密钥（从其他平台获取）
    2.明文
 返回值：
    密文
 */

+ (NSString *)inputKey:(NSString *)key WithText:(NSString *)plainText;
/*
 参数：
    1.解密密钥（解密的密钥＝固定的密钥＋输入的密文）
    2.密文
 返回值：
    明文
 */
+ (NSString *)key:(NSString *)key WithText:(NSString *)criptText;
@end
