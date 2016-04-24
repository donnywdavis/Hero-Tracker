//
//  VillainTableViewController.m
//  Hero-Tracker
//
//  Created by Donny Davis on 4/24/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "VillainTableViewController.h"
#import "CharacterDetailViewController.h"
#import "Character.h"

@interface VillainTableViewController ()

@property (nonatomic) NSMutableArray *villains;
@property (nonatomic) Character *selectedVillain;

- (void)loadVillains;

@end

@implementation VillainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"S.H.I.E.L.D. Villain Tracker";
    self.villains = [[NSMutableArray alloc] init];
    [self loadVillains];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadVillains {
    // This creates a string with the filepath to the NOC List JSON file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"villains" ofType:@"json"];
    // This is a built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
    NSArray *villains = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    // Build our Hero objects and store in our array
    for (NSDictionary *villain in villains) {
        [self.villains addObject:[Character characterWithDictionary:villain]];
    }
    
    if (villains) {
        // Sort the array by name
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        self.villains = [[self.villains sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.villains.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VillainCell" forIndexPath:indexPath];
    
    Character *villain = self.villains[indexPath.row];
    
    cell.imageView.layer.cornerRadius = 20.0;
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.image = [UIImage imageNamed:villain.smallImage];
    cell.textLabel.text = villain.name;
    cell.detailTextLabel.text = villain.firstName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Deselect our row first
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Get the selected hero
    self.selectedVillain = self.villains[indexPath.row];
    
    // Perform segue
    [self performSegueWithIdentifier:@"CharacterDetail" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CharacterDetail"]) {
        [(CharacterDetailViewController *)segue.destinationViewController setCharacter:self.selectedVillain];
        [self setSelectedVillain:nil];
    }
}

@end
