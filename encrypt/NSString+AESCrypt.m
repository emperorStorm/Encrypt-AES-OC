//
//  NSString+AESCrypt.m
//
#import "NSString+AESCrypt.h"
#import "NSData+AESCrypt.h"
#import "NSString+MD5Encrypt.h"

@implementation NSString (AESCrypt)

/*
 *加密方式:
 *  key->md5加密
 *          |
 *  明文------>AES加密-->base64加密-->密文
 */
- (NSString *)AES256EncryptWithKey:(NSString *)key
{
    //密钥md5加密
    NSString *md5Key = key.md5Encrypt;
    //明文字符串转换成UTF8编码
    NSData *plainData = [self dataUsingEncoding:NSUTF8StringEncoding];
    //AES加密（加密后的密钥＋UTF8的编码）
    NSData *encryptedData = [plainData AES256EncryptWithKey:md5Key];
    //base64加密
    NSString *encryptedString = [encryptedData base64Encoding];
    return encryptedString;
}

/*
 *解密方式:
 *  key------------>md5加密
 *                    |
 *  密文-->base64解密---->AES解密-->明文
 */
- (NSString *)AES256DecryptWithKey:(NSString *)key
{
    //密钥md5加密
    NSString *md5Key = key.md5Encrypt;
    //密文base64解密
    NSData *encryptedData = [NSData dataWithBase64EncodedString:self];
    //密文＋密钥-->AES解密
    NSData *plainData = [encryptedData AES256DecryptWithKey:md5Key];
    //转码（UTF8）
    NSString *plainString = [[NSString alloc] initWithData:plainData encoding:NSUTF8StringEncoding];
    return plainString;
}

@end
