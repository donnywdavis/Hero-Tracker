//
//  HeroTableViewController.m
//  Hero-Tracker
//
//  Created by Donny Davis on 4/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "HeroTableViewController.h"
#import "HeroDetailViewController.h"
#import "Hero.h"

@interface HeroTableViewController ()

@property NSMutableArray *heroes;

- (void)loadHeroes;

@end

@implementation HeroTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"S.H.I.E.L.D. Hero Tracker";
    self.heroes = [[NSMutableArray alloc] init];
    [self loadHeroes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadHeroes {
    // This creates a string with the filepath to the NOC List JSON file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@"json"];
    // This is a built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
    NSArray *heroes = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    // Build our Hero objects and store in our array
    for (NSDictionary *hero in heroes) {
        [self.heroes addObject:[Hero heroWithDictionary:hero]];
    }
    
    // Sort the array by name
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    self.heroes = [[self.heroes sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.heroes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeroCell" forIndexPath:indexPath];
    
    // Grab a hero to display
    Hero *hero = self.heroes[indexPath.row];
    
    // Populate the cell data
    cell.textLabel.text = hero.name;
//    cell.detailTextLabel.text = hero.homeWorld;
    
    return cell;
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    HeroDetailViewController *heroDetailVC = [[HeroDetailViewController alloc] init];
//    [heroDetailVC setHero:self.heroes[indexPath.row]];
//}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"HeroDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Hero *hero = self.heroes[indexPath.row];
        HeroDetailViewController *heroDetailVC = [segue destinationViewController];
        heroDetailVC.hero = hero;
    }
}

@end
