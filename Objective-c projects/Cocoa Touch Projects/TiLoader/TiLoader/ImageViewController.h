//
//  ImageViewController.h
//  TiLoader
//
//  Created by Ahmed Alkatheeri on 10/5/13.
//  Copyright (c) 2013 Ahmed Alkatheeri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController {
    IBOutlet UIImageView *currentImageView;
    UIImage *thumb;
}
-(void) setThumb: (UIImage*) image;
@end
