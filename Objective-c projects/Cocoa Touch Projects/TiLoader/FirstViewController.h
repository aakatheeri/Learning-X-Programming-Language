//
//  FirstViewController.h
//  TiLoader
//
//  Created by Ahmed Alkatheeri on 10/3/13.
//  Copyright (c) 2013 Ahmed Alkatheeri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MessageUI/MessageUI.h>

@interface FirstViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    IBOutlet UITableView *tableViewContent;
    NSMutableArray *tableViewData;
    ALAssetsLibrary *assetsLibrary;
    int picked;
    NSIndexPath *pathIndexOfCell;
}
-(IBAction) addNewPicture;
-(IBAction) composePictures:(id)sender;
@end
