//
//  ImageViewController.m
//  TiLoader
//
//  Created by Ahmed Alkatheeri on 10/5/13.
//  Copyright (c) 2013 Ahmed Alkatheeri. All rights reserved.
//

#import "ImageViewController.h"
//#import "FirstViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        self.navigationController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonSystemItemAction target:self action:@selector(backToFirst)];
        currentImageView = [[UIImageView alloc] init];
    }
    return self;
}

//-(void) setImageView:(UIImage*) image withOrderNumber: (int) number {
//        imageIndex = number;
//        self.title = [NSString stringWithFormat:@"Image %i", imageIndex];
//}


-(void) setThumb: (UIImage*) image {
    thumb = image;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [currentImageView setImage:thumb];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated {
    if ([currentImageView image] != nil) {
        NSLog(@"The image is exist!");
    }
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
