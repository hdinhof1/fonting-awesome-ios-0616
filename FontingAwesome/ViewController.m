//
//  ViewController.m
//  FontingAwesome
//
//  Created by Henry Dinhofer on 6/29/16.
//  Copyright © 2016 Henry Dinhofer. All rights reserved.
//

#import "ViewController.h"
#import "FontAwesomeKit/FontAwesomeKit.h"
#import <ChameleonFramework/Chameleon.h>
#import "CWStatusBarNotification.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) CWStatusBarNotification *notification;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    
    FAKFoundationIcons *bookmarkIcon = [FAKFoundationIcons bookmarkIconWithSize:50];
    FAKZocial *twitterIcon = [FAKZocial twitterIconWithSize:50];
    

    NSLog(@"%@", twitterIcon);
 
    
    //[self.buttonOne setAttributedTitle: twitterIcon.attributedString forState: UIControlStateNormal];
    
    
    self.label.adjustsFontSizeToFitWidth = YES;
    self.label.attributedText = [bookmarkIcon attributedString];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonTapped:(id)sender {
    NSDictionary *icons = [FAKFontAwesome allIcons];
    NSArray *keys = icons.allKeys;
    NSUInteger random = arc4random_uniform((uint32_t)keys.count);
    
    FAKIcon *icon = [FAKFontAwesome iconWithCode:keys[random] size:70.f];
    [icon addAttribute:NSForegroundColorAttributeName value:[UIColor randomFlatColor]];
    
    self.notification = [CWStatusBarNotification new];
    self.notification.notificationStyle = CWNotificationStyleNavigationBarNotification; //make notification BIG
    self.notification.notificationLabelBackgroundColor = [UIColor flatGrayColor]; //thanks Chameleon
    
    [self.notification displayNotificationWithMessage:[NSString stringWithFormat:@"This is %@!", icon.iconName] forDuration:1.f];
 
    self.label.attributedText = icon.attributedString;
    
}

@end
