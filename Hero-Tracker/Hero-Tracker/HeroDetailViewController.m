//
//  HeroDetailViewController.m
//  Hero-Tracker
//
//  Created by Donny Davis on 4/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "HeroDetailViewController.h"

@interface HeroDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *powersLabel;

- (void)loadDetail;

@end

@implementation HeroDetailViewController

- (void)setHero:(Hero *)newHero {
    if (_hero != newHero) {
        _hero = newHero;
        [self loadDetail];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadDetail];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadDetail {
    if (self.hero) {
        self.title = [NSString stringWithFormat:@"%@", self.hero.name];
        if (![self.hero.middleName isEqualToString:@""]) {
            self.nameLabel.text = [NSString stringWithFormat:@"%@ %@ %@", self.hero.firstName, self.hero.middleName, self.hero.lastName];
        } else {
            self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", self.hero.firstName, self.hero.lastName];
        }
        self.heightLabel.text = ![self.hero.height isEqualToString:@""] ? [NSString stringWithFormat:@"%@", self.hero.height] : @"Not on file";
        self.weightLabel.text = ![self.hero.weight isEqualToString:@""] ? [NSString stringWithFormat:@"%@", self.hero.weight] : @"Not on file";
        self.powersLabel.text = [NSString stringWithFormat:@"%@", self.hero.powers];
    } else {
        self.title = @"Error";
        self.nameLabel.text = @"No data found";
        self.heightLabel.text = @"No data found";
        self.weightLabel.text = @"No data found";
        self.powersLabel.text = @"No data found";
    }
}

@end
