//
//  NSString+AESCrypt.h
//
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
 *  密文-->base64解密---->AES解密-->明文
 */

#import <Foundation/Foundation.h>

@interface NSString (AESCrypt)

/*
 \internal
 @function AES256EncryptWithKey
 @abstract This function accepts the key to encrypt the NSString and return the encrypted 
           string.
 @discussion Converts the string to NSData and calls the encryption method of NSData and
             then converts the encrypted NSData to string and returns the encrypted string.
 @result Returns the encrypted string.
 */
- (NSString *)AES256EncryptWithKey:(NSString *)key;

/*
 \internal
 @function AES256DecryptWithKey
 @abstract This function accepts the key to dencrypt the NSString and return the plain 
 string.
 @discussion Converts the encrypted string to encrypted NSData and calls the decryption method of NSData to get the plain NSData which is then converted to string.
 @result Returns the encrypted string.
 */
- (NSString *)AES256DecryptWithKey:(NSString *)key;

@end
