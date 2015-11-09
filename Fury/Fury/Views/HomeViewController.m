//
//  HomeViewController.m
//  Fury
//
//  Created by Christopher L. Price on 11/4/15.
//  Copyright © 2015 Christopher L. Price. All rights reserved.
//

#import "HomeViewController.h"
#import "PSCollectionView.h"
#import "NewsCell.h"
#import "ReportsCell.h"
#import "AdministrationCell.h"
#import "WorkshopCell.h"

#import "NewsSuggestionViewController.h"
#import "ReportsSuggestionViewController.h"
#import "AdministrationSuggestionViewController.h"
#import "WorkshopsSuggestionViewController.h"

#import <QuartzCore/QuartzCore.h>

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface HomeViewController (){
    NSString *type;
    NSMutableArray *cellType;
    NSMutableArray *arrayOne;
    NSMutableArray *newsArray;
    NSMutableArray *reportsArray;
    NSMutableArray *workshopsArray;
    NSMutableArray *administrationArray;
    
}
@end
UIRefreshControl *refreshControl;
@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self preferredStatusBarStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    type = @"all"; //default is all
    
    //init waterFlowView
    self.waterFLowView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    self.waterFLowView.delegate = self; // This is for UIScrollViewDelegate
    self.waterFLowView.collectionViewDelegate = self;
    self.waterFLowView.collectionViewDataSource = self;
    self.waterFLowView.backgroundColor = [UIColor clearColor];
    self.waterFLowView.autoresizingMask = ~UIViewAutoresizingNone;
    
    //waterFlow header
    //    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    //    header.backgroundColor = [UIColor clearColor];
    //
    //    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 290, 90)];
    //    headerView.backgroundColor = [UIColor whiteColor];
    //    headerView.layer.cornerRadius = 5;
    //    headerView.layer.masksToBounds = YES;
    //
    //    [header addSubview:headerView];
    //    self.waterFLowView.headerView = header;
    
    //waterFlow footer
    /*
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 300, 50)];
    label.text = @"Loading...";
    self.waterFLowView.footerView = label;
    */
    
    // Specify number of columns for both
    self.waterFLowView.numColsPortrait = 2;
    //    self.waterFLowView.numColsLandscape = 4;   //This is for iPad
    [self.view addSubview:self.waterFLowView];
    
    //[self addRefreshView];
    // Initialize the refresh control.
    
    refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.backgroundColor = RGBCOLOR(126, 3, 8);//126,3,8 Fury red
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self
                            action:@selector(refreshNewData)
                  forControlEvents:UIControlEventValueChanged];
    
    [self.waterFLowView addSubview:refreshControl];
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
        //[arrayOne removeAllObjects];
        [newsArray removeAllObjects];
        [reportsArray removeAllObjects];
        [workshopsArray removeAllObjects];
        [administrationArray removeAllObjects];
        [cellType removeAllObjects];
        
        //arrayOne = [[NSMutableArray alloc]init];
        newsArray = [[NSMutableArray alloc] init];
        reportsArray = [[NSMutableArray alloc] init];
        workshopsArray = [[NSMutableArray alloc] init];
        administrationArray = [[NSMutableArray alloc] init];
        cellType = [[NSMutableArray alloc] init];
        
        //[arrayOne addObject:[NSString stringWithFormat:@"Title %d",i]];
        // Fill arrays with fake data for demonstration purposes
        [newsArray addObject:[NSString stringWithFormat:@"IBM & TWC"]];
        [newsArray addObject:[NSString stringWithFormat:@"UA Earnings"]];
        [newsArray addObject:[NSString stringWithFormat:@"Chick-fil-a"]];
        [newsArray addObject:[NSString stringWithFormat:@"Southwire Expands"]];
        
        [reportsArray addObject:[NSString stringWithFormat:@"Services Review"]];
        [reportsArray addObject:[NSString stringWithFormat:@"Case Reviews"]];
        [reportsArray addObject:[NSString stringWithFormat:@"IT Health"]];
        [reportsArray addObject:[NSString stringWithFormat:@"Products Review"]];
        
        [workshopsArray addObject:[NSString stringWithFormat:@"SCCM 2012"]];
        [workshopsArray addObject:[NSString stringWithFormat:@"ADFS"]];
        [workshopsArray addObject:[NSString stringWithFormat:@"Skype for Business"]];
        [workshopsArray addObject:[NSString stringWithFormat:@"SQL Server"]];
        
        [administrationArray addObject:[NSString stringWithFormat:@"SDP Update"]];
        [administrationArray addObject:[NSString stringWithFormat:@"Update Contact"]];
        [administrationArray addObject:[NSString stringWithFormat:@"Renewal"]];
        [administrationArray addObject:[NSString stringWithFormat:@"Scoping Call"]];
        
        [cellType addObject:[self getRandomType]];
        [cellType addObject:[self getRandomType]];
        [cellType addObject:[self getRandomType]];
        [cellType addObject:[self getRandomType]];
        /*
        for (int i = 0; i < 8; i++) {
            [arrayOne addObject:[NSString stringWithFormat:@"Title %d",i]];
            [cellType addObject:[self getRandomType]];
        }
        */
        /*
         
         *do some thing stuff to load the data
         *你可以在这里加载本地数据
         
         */
        dispatch_async(dispatch_get_main_queue(), ^{
            /*
             *when the data is finishing load ,slimeView will hide.
             *当数据加载完毕，隐藏slimeView
             */
            // End the refreshing
            if (refreshControl) {
                
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"MMM d, h:mm a"];
                NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
                NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                            forKey:NSForegroundColorAttributeName];
                NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
                refreshControl.attributedTitle = attributedTitle;
                
                [refreshControl endRefreshing];
            }
            [self.slimeView endRefresh];   //after 3 seconds, the slimeView will hide
            [self.waterFLowView reloadData];
        });
    });
}

- (void)loadMOreData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //        sleep(3);
        int count = (int) arrayOne.count;
        for (int i = count; i < count+4; i++) {
            //[arrayOne addObject:[NSString stringWithFormat:@"%d",i]];
            
            [newsArray addObject:[NSString stringWithFormat:@"IBM & TWC"]];
            [reportsArray addObject:[NSString stringWithFormat:@"Services Review"]];
            [workshopsArray addObject:[NSString stringWithFormat:@"Skype for Business"]];
            [administrationArray addObject:[NSString stringWithFormat:@"SDP Update"]];
            
            [cellType addObject:[self getRandomType]];

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
    if ([type isEqualToString:@"reports"]) {
        return [ReportsCell class];
    }else if ([type isEqualToString:@"workshops"]){
        return [WorkshopCell class];
    }else if ([type isEqualToString:@"news"]){
        return [NewsCell class];
    }else if ([type isEqualToString:@"administration"]){
        return [AdministrationCell class];
    }
    return nil;
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index{
    NSLog(@"you selected cell index:%ld",(long)index);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    if ([cellType[index] isEqualToString:@"reports"]) {
        UINavigationController *navController = [storyboard instantiateViewControllerWithIdentifier:@"ReportsCellSelectedNavigationController"];
        
        ReportsSuggestionViewController *reportsSuggestionViewController = [storyboard instantiateViewControllerWithIdentifier:@"ReportsSuggestionViewController"];
        
        reportsSuggestionViewController.image = [UIImage imageNamed:[NSString stringWithFormat:@"reports%ld.png",(long)index]];
        reportsSuggestionViewController.header = [NSString stringWithFormat:@"%@", [reportsArray objectAtIndex:index]];
        reportsSuggestionViewController.subtitle = [NSString stringWithFormat:@"You could do a %@ today", [reportsArray objectAtIndex:index]];
        
        [navController initWithRootViewController:reportsSuggestionViewController];
        
        [self showDetailViewController:navController sender:self];//]:navController animated:YES completion:nil];

    }else if([cellType[index] isEqualToString:@"workshops"])
    {//Come learn about %@ admin. and support
        UINavigationController *navController = [storyboard instantiateViewControllerWithIdentifier:@"WorkshopsCellSelectedNavigationController"];
        
        WorkshopsSuggestionViewController *workshopSuggestionViewController = [storyboard instantiateViewControllerWithIdentifier:@"WorkshopsSuggestionViewController"];
        
        
        
        workshopSuggestionViewController.image = [UIImage imageNamed:[NSString stringWithFormat:@"workshop%ld.jpg",(long)index]];
        workshopSuggestionViewController.header = [NSString stringWithFormat:@"%@", [workshopsArray objectAtIndex:index]];
        workshopSuggestionViewController.subtitle = [NSString stringWithFormat:@"Come learn about %@ admin. and support", [workshopsArray objectAtIndex:index]];
        
        [navController initWithRootViewController:workshopSuggestionViewController];
        
        [self presentViewController:navController animated:YES completion:nil];
    }else if ([cellType[index] isEqualToString:@"news"])
    {
        UINavigationController *navController = [storyboard instantiateViewControllerWithIdentifier:@"NewsCellSelectedNavigationController"];
        
         NewsSuggestionViewController *newsSuggestionViewController = [storyboard instantiateViewControllerWithIdentifier:@"NewsSuggestionViewController"];
        
       
        
        newsSuggestionViewController.image = [UIImage imageNamed:[NSString stringWithFormat:@"news%ld.jpg",(long)index]];
        newsSuggestionViewController.header = [NSString stringWithFormat:@"%@", [newsArray objectAtIndex:index]];
        newsSuggestionViewController.subtitle = [NSString stringWithFormat:@"Found %@ in the news today", [newsArray objectAtIndex:index]];
        
        [navController initWithRootViewController:newsSuggestionViewController];
        
        [self presentViewController:navController animated:YES completion:nil];
    }else if ([cellType[index] isEqualToString:@"administration"])
    {
        UINavigationController *navController = [storyboard instantiateViewControllerWithIdentifier:@"AdministrationCellSelectedNavigationController"];
        
        AdministrationSuggestionViewController *administrationSuggestionViewController = [storyboard instantiateViewControllerWithIdentifier:@"AdministrationSuggestionViewController"];
        
        administrationSuggestionViewController.image = [UIImage imageNamed:[NSString stringWithFormat:@"administration%ld.jpg",(long)index]];
        administrationSuggestionViewController.header = [NSString stringWithFormat:@"%@", [administrationArray objectAtIndex:index]];
        administrationSuggestionViewController.subtitle = [NSString stringWithFormat:@"You could do a %@ today", [administrationArray objectAtIndex:index]];
        
        [navController initWithRootViewController:administrationSuggestionViewController];
        
        [self presentViewController:navController animated:YES completion:nil];
    }
}

- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView {
    return cellType.count;
}

- (NSString *)getRandomType
{
    NSString *randomType;
    NSInteger *rand = arc4random_uniform(4);
    
    //int mapX = (int)[(NSNumber *)[templateObject valueForKey:@"mapX"] integerValue];
    if (rand == 0) {
        randomType = @"reports";
        
    }else if (rand == 1)
    {
        randomType = @"news";
        
    }else if (rand == 2)
    {
        randomType = @"workshops";
    }else if (rand == 3)
    {
        randomType = @"administration";
    }
    
    return randomType;
}

- (UIView *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index {
    
    //NSString *item = [cellType objectAtIndex:index]; // your dataModel
    NSString *itemType = [cellType objectAtIndex:index];
    
    if ([itemType isEqualToString:@"reports"]) {
        ReportsCell *cell = (ReportsCell *)[self.waterFLowView dequeueReusableViewForClass:[ReportsCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ReportsCell" owner:self options:nil];
            cell = (ReportsCell *)[nib objectAtIndex:0];
        }
        cell.reportTitle.text = [NSString stringWithFormat:@"%@", [reportsArray objectAtIndex:index]];
        cell.reportDescription.text = [NSString stringWithFormat:@"You could do a %@ today", [reportsArray objectAtIndex:index]];
        // check if image exists
        if([UIImage imageNamed:[NSString stringWithFormat:@"reports%ld.png",(long)index]]){
            cell.reportImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"reports%ld.png",(long)index]];
        }else{
            cell.reportImage.image = [UIImage imageNamed:@"defaultReports.png"];
        }
        
        // Round Profile Image
        // Get the Layer of any view
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        //        view.layer.cornerRadius = 5;
        //        view.layer.masksToBounds = YES;
        // Creating
        GHContextMenuView* overlay = [[GHContextMenuView alloc] init];
        overlay.dataSource = self;
        overlay.delegate = self;
        
        //UILongPressGestureRecognizer* _longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:overlay action:@selector(longPressDetected:)];
        //[self.view addGestureRecognizer:_longPressRecognizer];
        //[cell addGestureRecognizer:_longPressRecognizer];
        
        [cell collectionView:_waterFLowView fillCellWithObject:itemType atIndex:index];
        return cell;
        
    }else if ([itemType isEqualToString:@"workshops"]){
        WorkshopCell *cell = (WorkshopCell *)[self.waterFLowView dequeueReusableViewForClass:[WorkshopCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WorkshopCell" owner:self options:nil];
            cell = (WorkshopCell *)[nib objectAtIndex:0];
        }
        cell.workshopTitle.text = [NSString stringWithFormat:@"%@", [workshopsArray objectAtIndex:index]];
        cell.workshopDescription.text = [NSString stringWithFormat:@"Come learn about %@ admin. and support", [workshopsArray objectAtIndex:index]];
        // check if image exists
        if([UIImage imageNamed:[NSString stringWithFormat:@"workshop%ld.jpg",(long)index]]){
            cell.workshopImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"workshop%ld.jpg",(long)index]];
        }else{
            cell.workshopImage.image = [UIImage imageNamed:@"defaultWorkshops.jpg"];
        }
        // Round Profile Image
        // Get the Layer of any view
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        //        view.layer.cornerRadius = 5;
        //        view.layer.masksToBounds = YES;
        // Creating
        GHContextMenuView* overlay = [[GHContextMenuView alloc] init];
        overlay.dataSource = self;
        overlay.delegate = self;
        
        //UILongPressGestureRecognizer* _longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:overlay action:@selector(longPressDetected:)];
        //[self.view addGestureRecognizer:_longPressRecognizer];
        //[cell addGestureRecognizer:_longPressRecognizer];
        
        [cell collectionView:_waterFLowView fillCellWithObject:itemType atIndex:index];
        return cell;
    }else if ([itemType isEqualToString:@"news"]){
        NewsCell *cell = (NewsCell *)[self.waterFLowView dequeueReusableViewForClass:[NewsCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:self options:nil];
            cell = (NewsCell *)[nib objectAtIndex:0];
        }
        cell.title.text = [NSString stringWithFormat:@"%@", [newsArray objectAtIndex:index]];
        cell.newsDescription.text = [NSString stringWithFormat:@"Found %@ in the news", [newsArray objectAtIndex:index]];
        // check if image exists
        NSString *newsImage = [NSString stringWithFormat:@"news%ld.jpg",(long)index];
        if([UIImage imageNamed:newsImage]){
            cell.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"news%ld.jpg",(long)index]];
        }else{
            cell.image.image = [UIImage imageNamed:@"defaultNews.jpg"];
        }
        
        // Round Profile Image
        // Get the Layer of any view
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        //        view.layer.cornerRadius = 5;
        //        view.layer.masksToBounds = YES;
        // Creating
        GHContextMenuView* overlay = [[GHContextMenuView alloc] init];
        overlay.dataSource = self;
        overlay.delegate = self;
        
        //UILongPressGestureRecognizer* _longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:overlay action:@selector(longPressDetected:)];
        //[self.view addGestureRecognizer:_longPressRecognizer];
        //[cell addGestureRecognizer:_longPressRecognizer];
        
        //[cell collectionView:_waterFLowView fillCellWithObject:item atIndex:index];
        return cell;
        
    }else if ([itemType isEqualToString:@"administration"]){
        AdministrationCell *cell = (AdministrationCell *)[self.waterFLowView dequeueReusableViewForClass:[AdministrationCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AdministrationCell" owner:self options:nil];
            cell = (AdministrationCell *)[nib objectAtIndex:0];
        }
        cell.administrationTitle.text = [NSString stringWithFormat:@"%@", [administrationArray objectAtIndex:index]];
        cell.administrationDescription.text = [NSString stringWithFormat:@"You could do a %@ today", [administrationArray objectAtIndex:index]];
        // check if image exists
        NSString *administrationImage = [NSString stringWithFormat:@"news%ld.jpg",(long)index];
        if([UIImage imageNamed:administrationImage]){
            cell.administrationImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"administration%ld.jpg",(long)index]];
        }else{
            cell.administrationImage.image = [UIImage imageNamed:@"defaultAdministration.jpg"];
        }
        
        // Round Profile Image
        // Get the Layer of any view
        cell.layer.cornerRadius = 5;
        cell.layer.masksToBounds = YES;
        //        view.layer.cornerRadius = 5;
        //        view.layer.masksToBounds = YES;
        // Creating
        GHContextMenuView* overlay = [[GHContextMenuView alloc] init];
        overlay.dataSource = self;
        overlay.delegate = self;
        
        //UILongPressGestureRecognizer* _longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:overlay action:@selector(longPressDetected:)];
        //[self.view addGestureRecognizer:_longPressRecognizer];
        //[cell addGestureRecognizer:_longPressRecognizer];
        
        //[cell collectionView:_waterFLowView fillCellWithObject:item atIndex:index];
        return cell;
        
    }
    NewsCell *cell = (NewsCell *)[self.waterFLowView dequeueReusableViewForClass:[NewsCell class]];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:self options:nil];
        cell = (NewsCell *)[nib objectAtIndex:0];
    }
    return cell;
}

- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index {
    NSString *item = [cellType objectAtIndex:index];
    if ([type isEqualToString:@"reports"]) {
        return [ReportsCell rowHeightForObject:item inColumnWidth:_waterFLowView.colWidth];
    }else if ([type isEqualToString:@"workshops"]){
        return [WorkshopCell rowHeightForObject:item inColumnWidth:_waterFLowView.colWidth];
    }else if ([type isEqualToString:@"news"]){
        return [NewsCell rowHeightForObject:item inColumnWidth:_waterFLowView.colWidth];
    }else if ([type isEqualToString:@"administration"]){
        return [AdministrationCell rowHeightForObject:item inColumnWidth:_waterFLowView.colWidth];
    }
    return 300; // was 0
}

#pragma mark - GHContextMenu method

// Implementing data source methods
- (NSInteger) numberOfMenuItems
{
    return 3;
}

-(UIImage*) imageForItemAtIndex:(NSInteger)index
{
    NSString* imageName = nil;
    switch (index) {
        case 0:
            imageName = @"facebook-white";
            break;
        case 1:
            imageName = @"twitter-white";
            break;
        case 2:
            imageName = @"google-plus-white";
            break;
            
        default:
            break;
    }
    return [UIImage imageNamed:imageName];
}

- (void) didSelectItemAtIndex:(NSInteger)selectedIndex forMenuAtPoint:(CGPoint)point
{
    //NSIndexPath* indexPath = [self.view indexPathForItemAtPoint:point];
    //NSIndexPath* indexPath;// = [self.waterFLowView indexPathForCell:cell];
    //PSCollectionViewCell *cell = [self.waterFLowView.window :indexPath];
    NSString* msg = nil;
    switch (selectedIndex) {
        case 0:
            msg = @"Facebook Selected";
            break;
        case 1:
            msg = @"Twitter Selected";
            break;
        case 2:
            msg = @"Google Plus Selected";
            break;
        case 3:
            msg = @"Linkedin Selected";
            break;
        case 4:
            msg = @"Pinterest Selected";
            break;
            
        default:
            break;
    }
    
    //msg = [msg stringByAppendingFormat:@" for cell %ld", (long)indexPath.row +1];
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [gestureRecognizer locationInView:self.waterFLowView];
    
    //    NSIndexPath *indexPath = [self.waterFLowView]; //[self.waterFLowView indexPathForItemAtPoint:p];
    //    if (indexPath == nil){
    //        NSLog(@"couldn't find index path");
    //    } else {
    //        // get the cell at indexPath (the one you long pressed)
    //        UICollectionViewCell* cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    //        // do stuff with the cell
    //    }
}

#pragma mark - Button method
- (void)switchReports{
    type = @"reports";
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

- (void)filterByType:(NSString *)sortByType
{
    if ([sortByType isEqualToString:@"All"]){
        NSLog(@"Filter suggestions by %@", sortByType);
        type = @"all";
        [self.waterFLowView reloadData];
        
    }else if ([sortByType isEqualToString:@"Reports"]){
        NSLog(@"Filter suggestions by %@", sortByType);
        type = @"reports";
        [self.waterFLowView reloadData];
        
    }else if ([sortByType isEqualToString:@"Workshops"]){
        NSLog(@"Filter suggestions by %@", sortByType);
        type = @"workshops";
        [self.waterFLowView reloadData];
        
    }else if ([sortByType isEqualToString:@"News"]) {
        NSLog(@"Filter suggestions by %@", sortByType);
        type = @"news";
        [self.waterFLowView reloadData];
        
    }else if ([sortByType isEqualToString:@"Administration"]) {
        NSLog(@"Filter suggestions by %@", sortByType);
        type = @"administration";
        [self.waterFLowView reloadData];
        
    }
}

- (IBAction)menuButtonPressed:(id)sender {
    // Bring up a pop up that filter lawyers by their specialty
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Choose a category to filter results." message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"All" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self filterByType:@"All"];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Reports" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self filterByType:@"Reports"];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Workshops" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self filterByType:@"Workshops"];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"News" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self filterByType:@"News"];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Administration" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self filterByType:@"Administration"];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultSent:
            NSLog(@"You sent the email.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"You saved a draft of this email");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"You cancelled sending this email.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed:  An error occurred when trying to compose this email");
            break;
        default:
            NSLog(@"An error occurred when trying to compose this email");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
