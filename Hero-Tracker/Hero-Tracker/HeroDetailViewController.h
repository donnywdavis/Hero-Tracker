//
//  HeroDetailViewController.h
//  Hero-Tracker
//
//  Created by Donny Davis on 4/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeWorldLabel;
@property (weak, nonatomic) IBOutlet UILabel *powersLabel;

@end
