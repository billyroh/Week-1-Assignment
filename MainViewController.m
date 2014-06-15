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
@property (weak, nonatomic) IBOutlet UILabel *likeButtonLabel;
@property (weak, nonatomic) IBOutlet UIImageView *likeButtonSelected;
@property (weak, nonatomic) IBOutlet UITextField *commentBarTextField;
@property (weak, nonatomic) IBOutlet UIView *commentBarWrapperView;
- (IBAction)likeButtonTap:(id)sender;
- (IBAction)commentBarTextFieldEditing:(id)sender;
- (IBAction)commentBarEditingDidBegin:(id)sender;
- (IBAction)viewTap:(id)sender;

@property BOOL keyboardIsVisible;

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
    
    // NavigationBar - Back
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(nilSymbol)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    UIImage* image3 = [UIImage imageNamed:@"chevronleft.png"];
    CGRect frameimg = CGRectMake(0, 0, image3.size.width, image3.size.height);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
    [someButton addTarget:self action:@selector(nilSymbol)
         forControlEvents:UIControlEventTouchUpInside];
    [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.leftBarButtonItem = mailbutton;
    
    // cardView - rounded corners
    CALayer *layer = self.cardView.layer;
    layer.cornerRadius = 2;

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
    
    // Like button
    self.likeButtonSelected.layer.opacity = 0;
    
    // CommentBar
    CGRect frame = self.commentBarImageView.frame;
    frame.origin.y = self.tabBarController.tabBar.frame.origin.y;
    self.commentBarImageView.frame = frame;
    
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

- (IBAction)likeButtonTap:(id)sender {
    if (self.likeButtonSelected.layer.opacity == 0) {
        self.likeButtonSelected.layer.opacity = 1;
        self.likeButtonLabel.textColor = [UIColor colorWithRed:88.0f/255.0 green:144.0f/255.0 blue:255.0f/255.0 alpha:1.0];
    } else {
        self.likeButtonSelected.layer.opacity = 0;
        self.likeButtonLabel.textColor = [UIColor colorWithRed:100.0f/255.0 green:100.0f/255.0 blue:100.0f/255.0 alpha:1.0];
    }
}

- (IBAction)commentBarTextFieldEditing:(id)sender {
    UIImage *image = [UIImage imageNamed:@"commentbar"];
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    frame.origin.y = self.commentBarWrapperView.frame.origin.y + 80;
    self.commentBarWrapperView.frame = frame;
    NSLog(@"hello");
}

- (IBAction)commentBarEditingDidBegin:(id)sender {
    if (self.keyboardIsVisible == NO) {
        [UIView animateWithDuration:0.285 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGRect frame = CGRectMake(0, 0, 320, 45);
            frame.origin.y = self.commentBarWrapperView.frame.origin.y -168;
            self.commentBarWrapperView.frame = frame;
        }
                         completion:^(BOOL finished) {
                             
                         }];
        self.keyboardIsVisible = YES;
    }
}

- (IBAction)viewTap:(id)sender {
    if (self.keyboardIsVisible == YES) {
        [self.view endEditing:YES];
        [UIView animateWithDuration:0.285 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGRect frame = CGRectMake(0, 0, 320, 45);
            frame.origin.y = self.commentBarWrapperView.frame.origin.y + 168;
            self.commentBarWrapperView.frame = frame;
        }
                         completion:^(BOOL finished) {
                             
                         }];
        self.keyboardIsVisible = NO;
    }
}
@end
