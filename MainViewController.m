//
//  MainViewController.m
//  Week 1 Assignment
//
//  Created by Billy Roh on 6/11/14.
//  Copyright (c) 2014 Billy Roh. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <TTTAttributedLabel/TTTAttributedLabel.h>

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UIImageView *ufi;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *storyImageView;
@property (weak, nonatomic) IBOutlet UIImageView *commentBarImageView;

@end

@implementation MainViewController

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    // NavigationBar Text Setup
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.text = @"Post";
    label.font = [UIFont boldSystemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    
    // NavigationBar - Action
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(nilSymbol)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    // cardView - rounded corners
    CALayer *layer = self.cardView.layer;
    layer.cornerRadius = 2;
//    layer.masksToBounds = YES;

    // cardView - shadows
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 1.0f;
    layer.shadowOpacity = 0.20f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    
    // storyImageView - shadows
    CALayer *storyImageViewLayer = self.storyImageView.layer;
    storyImageViewLayer.shadowOffset = CGSizeMake(0, 0);
    storyImageViewLayer.shadowColor = [[UIColor blackColor] CGColor];
    storyImageViewLayer.shadowRadius = 2.0f;
    storyImageViewLayer.shadowOpacity = 0.20f;
    storyImageViewLayer.shadowPath = [[UIBezierPath bezierPathWithRect:storyImageViewLayer.bounds] CGPath];
    
    // CommentBar
//    self.bottomLayoutGuide
    
    // text
    NSString *text = @"From collarless shirts to high-waisted pants, #Her's costume designer, Casey Storm, explains how he created his fashion looks for the future: http://bit.ly/1jV9zM8";
    [self.bodyLabel setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"#Her" options:NSCaseInsensitiveSearch];
        
        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:14];
        self.bodyLabel.enabledTextCheckingTypes = NSTextCheckingTypeLink;

        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
            CFRelease(font);
        }
        
        NSArray *keys = [[NSArray alloc] initWithObjects:(id)kCTForegroundColorAttributeName,(id)kCTUnderlineStyleAttributeName
                         , nil];
        NSArray *objects = [[NSArray alloc] initWithObjects:[UIColor colorWithRed:99.0/255.0 green:123.0/255.0 blue:171.0/255.0 alpha:1],[NSNumber numberWithInt:kCTUnderlineStyleNone], nil];
        NSDictionary *linkAttributes = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
        
        self.bodyLabel.linkAttributes = linkAttributes;
        
        return mutableAttributedString;
    }];

    
    // UITabBar
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
