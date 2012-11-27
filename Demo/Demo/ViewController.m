//
//  ViewController.m
//  Demo
//
//  Created by Jean-Philippe Couture on 2012-11-27.
//  Copyright (c) 2012 Jean-Philippe Couture. All rights reserved.
//

#import "ViewController.h"
#import "DEFacebookComposeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareOnFacebook:(id)sender {
    __weak ViewController *weakSelf = self;
    DEFacebookComposeViewControllerCompletionHandler completionHandler = ^(DEFacebookComposeViewControllerResult result) {
        switch (result) {
            case DEFacebookComposeViewControllerResultCancelled:
                NSLog(@"Facebook Result: Cancelled");
                break;
            case DEFacebookComposeViewControllerResultDone:
                NSLog(@"Facebook Result: Sent");
                break;
        }
        [weakSelf dismissViewControllerAnimated:YES completion:NULL];
    };
    
    DEFacebookComposeViewController *facebookComposeViewController = [[DEFacebookComposeViewController alloc] init];
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
    [facebookComposeViewController setInitialText:@"The quick brown fox jumps over the lazy dog."];
    [facebookComposeViewController addImage:[UIImage imageNamed:@"winter.jpg"]];
    [facebookComposeViewController setCompletionHandler:completionHandler];
    [self presentViewController:facebookComposeViewController animated:YES completion:NULL];
}

@end
