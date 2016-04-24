//
//  CharacterDetailViewController.m
//  Hero-Tracker
//
//  Created by Donny Davis on 4/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "CharacterDetailViewController.h"

@interface CharacterDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *powersLabel;
@property (weak, nonatomic) IBOutlet UILabel *abilitiesLabel;

- (void)loadDetail;

@end

@implementation CharacterDetailViewController

- (void)setHero:(Character *)newCharacter {
    if (_character != newCharacter) {
        _character = newCharacter;
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
    if (self.character) {
        self.title = self.character.name;
        self.profileImage.image = ![self.character.largeImage isEqualToString:@""] ? [UIImage imageNamed:self.character.largeImage] : [UIImage imageNamed:@"no-image"];
        if (![self.character.middleName isEqualToString:@""]) {
            self.nameLabel.text = [NSString stringWithFormat:@"%@ %@ %@", self.character.firstName, self.character.middleName, self.character.lastName];
        } else {
            self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", self.character.firstName, self.character.lastName];
        }
        self.heightLabel.text = ![self.character.height isEqualToString:@""] ? self.character.height : @"Not on file";
        self.weightLabel.text = ![self.character.weight isEqualToString:@""] ? self.character.weight : @"Not on file";
        self.powersLabel.text = ![self.character.powers isEqualToString:@""] ? self.character.powers : @"Not on file";
        self.abilitiesLabel.text = ![self.character.abilities isEqualToString:@""] ? self.character.abilities : @"Not on file";
    } else {
        self.title = @"Error";
        self.nameLabel.text = @"No data found";
        self.heightLabel.text = @"No data found";
        self.weightLabel.text = @"No data found";
        self.powersLabel.text = @"No data found";
        self.abilitiesLabel.text = @"No data found";
    }
}

@end
