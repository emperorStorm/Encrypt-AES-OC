//
//  ViewController.m
//  encrypt
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "NSString+AESCrypt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//加密
- (IBAction)encrypt:(UIButton *)sender {
    NSString *KeyText = self.KeyText.text;
    NSString *plainText = self.plainText.text;
    //明文加密
    self.cryptText.text = [SymmetricCryptor inputKey:KeyText WithText:plainText];
    //密钥加密
    self.KeyText.text = [SymmetricCryptor getEncryptKey:KeyText];
    self.plainText.text = @"";
}

//解密
- (IBAction)decrypt:(UIButton *)sender {
    NSString *KeyText = self.KeyText.text;
    NSString *cryptText = self.cryptText.text;
    self.plainText.text = [SymmetricCryptor key:KeyText WithText:cryptText];
    self.cryptText.text = @"";
}

@end
