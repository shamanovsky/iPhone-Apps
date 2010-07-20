//
//  RootViewController.m
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "RootViewController.h"
#import "CompanyAppDelegate.h"
#import "Company.h"

#import "MyTableCell.h"


@implementation RootViewController
@synthesize companyView;

#define LABEL_TAG 1 
#define VALUE_TAG 2 
#define FIRST_CELL_IDENTIFIER @"TrailItemCell" 
#define SECOND_CELL_IDENTIFIER @"RegularCell" 

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.title = @"MarketApp";
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	CompanyAppDelegate *appDelegate = (CompanyAppDelegate *)[[UIApplication sharedApplication] delegate];
	
    return appDelegate.companies.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath22:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	CompanyAppDelegate *appDelegate = (CompanyAppDelegate *)[[UIApplication sharedApplication] delegate];
	Company *f = (Company *)[appDelegate.companies objectAtIndex:indexPath.row];
	
	[cell setText:f.name];
	
	return cell;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *MyIdentifier = [NSString stringWithFormat:@"MyIdentifier %i", indexPath.row];
	
	MyTableCell *cell = (MyTableCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	if (cell == nil) {

		
		cell = [[[MyTableCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
		
		CompanyAppDelegate *appDelegate = (CompanyAppDelegate *)[[UIApplication sharedApplication] delegate];
		Company *f = (Company *)[appDelegate.companies objectAtIndex:indexPath.row];

		
		UILabel *label = [[[UILabel	alloc] initWithFrame:CGRectMake(0.0, 0, 30.0, 
																	tableView.rowHeight)] autorelease]; 
		[cell addColumn:50];
		label.tag = LABEL_TAG; 
		label.font = [UIFont systemFontOfSize:12.0]; 
		label.text = [NSString stringWithFormat:@"%d", indexPath.row];
		label.textAlignment = UITextAlignmentRight; 
		label.textColor = [UIColor blueColor]; 
		label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | 
		UIViewAutoresizingFlexibleHeight; 
		[cell.contentView addSubview:label]; 
		
		label =  [[[UILabel	alloc] initWithFrame:CGRectMake(60.0, 0, 50.0, 
															tableView.rowHeight)] autorelease]; 
		[cell addColumn:120];
		label.tag = VALUE_TAG; 
		label.font = [UIFont systemFontOfSize:12.0]; 
		// add some silly value
		label.text = f.name;

//		label.text = [NSString stringWithFormat:@"%d", indexPath.row * 4];
		label.textAlignment = UITextAlignmentLeft; 
		label.textColor = [UIColor blueColor]; 
		label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | 
		UIViewAutoresizingFlexibleHeight; 
		[cell.contentView addSubview:label]; 
	

		label =  [[[UILabel	alloc] initWithFrame:CGRectMake(130.0, 0, 70.0, 
															tableView.rowHeight)] autorelease]; 
		[cell addColumn:170];
		label.tag = VALUE_TAG; 
		label.font = [UIFont systemFontOfSize:12.0]; 
		// add some silly value
		label.text = [NSString stringWithFormat:@"%.02f", f.lastPrice];

		//label.text = f.name;
		label.textAlignment = UITextAlignmentLeft; 
		label.textColor = [UIColor blueColor]; 
		label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | 
		UIViewAutoresizingFlexibleHeight; 
		[cell.contentView addSubview:label]; 
	}
	
	return cell;
}


	
// =====================
// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Navigation logic may go here -- for example, create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController animated:YES];
	// [anotherViewController release];
 
	CompanyAppDelegate *appDelegate = [(CompanyAppDelegate *)[UIApplication sharedApplication] delegate];
	Company *company = (Company *)[appDelegate.companies objectAtIndex:indexPath.row];
	
	if (self.companyView == nil) {
		CompanyViewController *viewController = [[CompanyViewController alloc] initWithNibName:@"CompanyViewController" bundle:[NSBundle mainBundle]];
		self.companyView = viewController;
		[viewController release];
	}
	
	[self.navigationController pushViewController:self.companyView animated:YES];
	self.companyView.title = [company name];
	[self.companyView.companyDescription setText:[company description]];
							 
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

