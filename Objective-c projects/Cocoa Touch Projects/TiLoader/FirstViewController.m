//
//  FirstViewController.m
//  TiLoader
//
//  Created by Ahmed Alkatheeri on 10/3/13.
//  Copyright (c) 2013 Ahmed Alkatheeri. All rights reserved.
//

#import "FirstViewController.h"
#import "ImageViewController.h"

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        tableViewData = [[NSMutableArray alloc] init];
        self.title = @"Pic Sender";
        picked = 0;
    }
    return self;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *) tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger)section {
    
    return [tableViewData count];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    ImageViewController *imageViewController = [[ImageViewController alloc] initWithNibName:@"ImageViewController" bundle:nil];
    [imageViewController setTitle:[NSString stringWithFormat:@"Image %d", indexPath.row+1]];
    [imageViewController setThumb:[tableViewData objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:imageViewController animated:YES];
    pathIndexOfCell = indexPath;
}

-(UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    }
    
    //cell.textLabel.text = [tableViewData objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Image %i", (indexPath.row + 1)];
    return cell;
}


// Add new picture
-(IBAction) addNewPicture {
    picked = 1;
    [self startMediaBrowserFromViewController: self usingDelegate:self];
}

- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    mediaUI.allowsEditing = NO;
    mediaUI.delegate = delegate;
    
    [controller presentViewController:mediaUI animated:YES completion:nil];
    return YES;
}

- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    [tableViewData addObject:[info objectForKey:
                              UIImagePickerControllerOriginalImage]];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// Compose current pictures
-(IBAction) composePictures:(id)sender {
    [self showEmail:[tableViewData indexOfObject:[tableViewData objectAtIndex:0]]];
}

- (void)showEmail:(int)indexOfImage {
    
    NSString *emailTitle = @"Great Photo and Doc";
    NSString *messageBody = @"Hey, check this out!";
    NSArray *toRecipents = [NSArray arrayWithObject:@"mobde3net@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    UIImage *image = [tableViewData objectAtIndex:indexOfImage];
    CGDataProviderRef provider = CGImageGetDataProvider(image.CGImage);
    NSData* data = (__bridge id)CGDataProviderCopyData(provider);
    //const uint8_t* bytes = [data bytes];
    
    // Add attachment
    [mc addAttachmentData:data mimeType:@"image/jpeg" fileName:[NSString stringWithFormat:@"Image %d", indexOfImage]];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"Current images => %i\n", [tableViewData count]);
    
    if (picked == 1) {
        [tableViewContent reloadData];
        picked = 0;
    } else {
        [tableViewContent deselectRowAtIndexPath:pathIndexOfCell animated:YES];
    }
    
    
    //NSData *potraitImgData = [NSData dataWithContentsOfFile:dataFile];
    //backgroundImagePotrait = [UIImage imageWithData:potraitImgData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
