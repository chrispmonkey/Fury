//
//  HomeViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/4/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "HomeViewController.h"
#import "PSCollectionView.h"
#import "MouthCell.h"
#import "PersonCell.h"
#import <QuartzCore/QuartzCore.h>

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface HomeViewController (){
    NSString *type;
    NSMutableArray *arrayOne;
}
@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self preferredStatusBarStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    type = @"mouth"; //default is mouth
    
    //init waterFlowView
    self.waterFLowView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    self.waterFLowView.delegate = self; // This is for UIScrollViewDelegate
    self.waterFLowView.collectionViewDelegate = self;
    self.waterFLowView.collectionViewDataSource = self;
    self.waterFLowView.backgroundColor = [UIColor clearColor];
    self.waterFLowView.autoresizingMask = ~UIViewAutoresizingNone;
    
    //waterFlow header
//    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
//    header.backgroundColor = [UIColor yellowColor];
//    self.waterFLowView.headerView = header;
    
    //waterFlow footer
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 300, 50)];
    label.text = @"Loading...";
    self.waterFLowView.footerView = label;
    
    // Specify number of columns for both
    self.waterFLowView.numColsPortrait = 2;
    //    self.waterFLowView.numColsLandscape = 4;   //This is for iPad
    [self.view addSubview:self.waterFLowView];
    
    //[self addRefreshView];
    [self refreshNewData];
    [self preferredStatusBarStyle];
}

- (void)addRefreshView{
    self.slimeView = [[SRRefreshView alloc] init];
    self.slimeView.delegate = self;
    self.slimeView.slimeMissWhenGoingBack = YES;
    self.slimeView.slime.bodyColor = RGBCOLOR(30, 119, 250);
    self.slimeView.slime.skinColor = RGBCOLOR(30, 119, 250);
    [self.waterFLowView addSubview:self.slimeView];
    [self.slimeView setLoadingWithexpansion];  //上来就刷新
    [self refreshNewData];
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.slimeView scrollViewDidScroll];
    
    float scrollViewHeight = scrollView.frame.size.height;
    float scrollContentSizeHeight = scrollView.contentSize.height;
    float scrollOffset = scrollView.contentOffset.y;
    if (scrollOffset <= 0) {
        NSLog(@"scroll to the top");
    }else if (scrollOffset + scrollViewHeight >= scrollContentSizeHeight) {
        NSLog(@"scroll to the bottom");
        [self loadMOreData];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.slimeView scrollViewDidEndDraging];
}

#pragma mark - SRRefreshView delegate
- (void)slimeRefreshStartRefresh:(SRRefreshView *)refreshView
{
    NSLog(@"refresh");
    [self refreshNewData];
}

#pragma mark - New fresh & load more method
- (void)refreshNewData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [arrayOne removeAllObjects];
        arrayOne = [[NSMutableArray alloc]init];
        for (int i = 0; i < 8; i++) {
            [arrayOne addObject:[NSString stringWithFormat:@"%d",i]];
        }
        /*
         
         *do some thing stuff to load the data
         *你可以在这里加载本地数据
         
         */
        dispatch_async(dispatch_get_main_queue(), ^{
            /*
             *when the data is finishing load ,slimeView will hide.
             *当数据加载完毕，隐藏slimeView
             */
            [self.slimeView endRefresh];   //after 3 seconds, the slimeView will hide
            [self.waterFLowView reloadData];
        });
    });
}

- (void)loadMOreData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //        sleep(3);
        for (int i = 0; i < 8; i++) {
            [arrayOne addObject:[NSString stringWithFormat:@"%d",i]];
        }
        /*
         *do some thing stuff to load the data
         *你可以在这里加载本地数据
         
         */
        dispatch_async(dispatch_get_main_queue(), ^{
            /*
             *when the data is finishing load ,slimeView will hide.
             *当数据加载完毕，隐藏slimeView
             */
            [self.slimeView endRefresh];   //after 3 seconds, the slimeView will hide
            [self.waterFLowView reloadData];
        });
    });
}


#pragma mark - PSCollectionView delegate & dataSource

- (Class)collectionView:(PSCollectionView *)collectionView cellClassForRowAtIndex:(NSInteger)index {
    if ([type isEqualToString:@"mouth"]) {
        return [PersonCell class];
    }else if ([type isEqualToString:@"person"]){
        return [MouthCell class];
    }
    return nil;
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index{
    NSLog(@"you select cell index:%ld",(long)index);
}

- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView {
    return arrayOne.count;
}

- (UIView *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index {
    NSString *item = [arrayOne objectAtIndex:index]; // your dataModel
    
    if ([type isEqualToString:@"mouth"]) {
        MouthCell *cell = (MouthCell *)[self.waterFLowView dequeueReusableViewForClass:[MouthCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MouthCell" owner:self options:nil];
            cell = (MouthCell *)[nib objectAtIndex:0];
        }
        cell.name.text = item;
        
        // Round Profile Image
        // Get the Layer of any view
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
//        view.layer.cornerRadius = 5;
//        view.layer.masksToBounds = YES;
        
        [cell collectionView:_waterFLowView fillCellWithObject:item atIndex:index];
        return cell;
        
    }else if ([type isEqualToString:@"person"]){
        PersonCell *cell = (PersonCell *)[self.waterFLowView dequeueReusableViewForClass:[PersonCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PersonCell" owner:self options:nil];
            cell = (PersonCell *)[nib objectAtIndex:0];
        }
        cell.name.text = item;
        [cell collectionView:_waterFLowView fillCellWithObject:item atIndex:index];
        return cell;
    }
    return nil;
}

- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index {
    NSString *item = [arrayOne objectAtIndex:index];
    if ([type isEqualToString:@"mouth"]) {
        return [MouthCell rowHeightForObject:item inColumnWidth:_waterFLowView.colWidth];
    }else if ([type isEqualToString:@"person"]){
        return [PersonCell rowHeightForObject:item inColumnWidth:_waterFLowView.colWidth];
    }
    return 0;
}


#pragma mark - Button method
- (void)switchMouth{
    type = @"mouth";
    self.waterFLowView.numColsPortrait = 2;
    [self.waterFLowView reloadData];
}

- (void)switchPerson{
    type = @"person";
    self.waterFLowView.numColsPortrait = 1;
    [self.waterFLowView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
// FUIALERT VIEW DELEGATES
-(void)alertView:(FUIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 100) {
        if (buttonIndex == 1) {
            NSLog(@"Shake Alert View Button Clicked");
            
            // Logout current user
            //[PFUser logOut];
            
            // Present login view controller
            //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            //UIViewController *timeLineNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"LoginNavigationController"];
            //[self presentViewController:timeLineNavigationController animated:YES completion:nil];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }
    else{
        
    }
}

- (void)alertView:(FUIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

- (void)alertView:(FUIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        
        FUIAlertView * frustratedAlert =[[FUIAlertView alloc ] initWithTitle:@"Shake Detected"
                                                                     message:@"Would you like to logout?"
                                                                    delegate:self
                                                           cancelButtonTitle:@"No"
                                                           otherButtonTitles: @"Yes", nil];
        frustratedAlert.tag = 100;
        frustratedAlert.titleLabel.textColor = [UIColor silverColor];
        frustratedAlert.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        frustratedAlert.messageLabel.textColor = [UIColor silverColor];
        frustratedAlert.messageLabel.font = [UIFont flatFontOfSize:14];
        frustratedAlert.backgroundOverlay.backgroundColor = [[UIColor silverColor] colorWithAlphaComponent:0.8];
        frustratedAlert.alertContainer.backgroundColor = [UIColor pomegranateColor];
        frustratedAlert.defaultButtonColor = [UIColor silverColor];
        frustratedAlert.defaultButtonShadowColor = [UIColor asbestosColor];
        frustratedAlert.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        frustratedAlert.defaultButtonTitleColor = [UIColor asbestosColor];
        
        [frustratedAlert show];
    }
}


@end
