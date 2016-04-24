//
//  HeroTableViewController.m
//  Hero-Tracker
//
//  Created by Donny Davis on 4/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "HeroTableViewController.h"
#import "CharacterDetailViewController.h"
#import "Character.h"

@interface HeroTableViewController ()

@property (nonatomic) NSMutableArray *heroes;
@property (nonatomic) Character *selectedHero;

- (void)loadHeroes;

@end

@implementation HeroTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.heroes = [[NSMutableArray alloc] init];
    [self loadHeroes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadHeroes {
    // This creates a string with the filepath to the JSON file.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@"json"];
    // This is a built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
    NSArray *heroes = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    // Build our Hero objects and store in our array
    for (NSDictionary *hero in heroes) {
        [self.heroes addObject:[Character characterWithDictionary:hero]];
    }
    
    if (heroes) {
        // Sort the array by name
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        self.heroes = [[self.heroes sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
        [self.tableView reloadData];
    }
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
    Character *hero = self.heroes[indexPath.row];
    
    // Populate the cell data
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.layer.cornerRadius = 20.0;
    cell.imageView.image = [UIImage imageNamed:hero.smallImage];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.firstName;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Deselect our row first
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Get the selected hero
    self.selectedHero = self.heroes[indexPath.row];
    
    // Perform segue
    [self performSegueWithIdentifier:@"CharacterDetail" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CharacterDetail"]) {
        [(CharacterDetailViewController *)segue.destinationViewController setCharacter:self.selectedHero];
        [self setSelectedHero:nil];
    }
}

@end
