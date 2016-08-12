//
//  ViewController.h
//  encrypt
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymmetricCryptor.h"
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *KeyText;
@property (weak, nonatomic) IBOutlet UITextView *plainText;

@property (weak, nonatomic) IBOutlet UITextView *cryptText;

@end

