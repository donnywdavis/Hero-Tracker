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
    self.title = [NSString stringWithFormat:@"%@", self.hero.name];
    
    if (self.hero) {
        if (![self.hero.middleName isEqualToString:@""]) {
            self.nameLabel.text = [NSString stringWithFormat:@"%@ %@ %@", self.hero.firstName, self.hero.middleName, self.hero.lastName];
        } else {
            self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", self.hero.firstName, self.hero.lastName];
        }
        self.heightLabel.text = ![self.hero.height isEqualToString:@""] ? [NSString stringWithFormat:@"%@", self.hero.height] : @"Not on file";
        self.weightLabel.text = ![self.hero.weight isEqualToString:@""] ? [NSString stringWithFormat:@"%@", self.hero.weight] : @"Not on file";
        self.powersLabel.text = [NSString stringWithFormat:@"%@", self.hero.powers];
    } else {
        self.nameLabel.text = @"";
        self.heightLabel.text = @"";
        self.weightLabel.text = @"";
        self.powersLabel.text = @"";
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
