//
//  Hero.h
//  Hero-Tracker
//
//  Created by Donny Davis on 4/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *middleName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *height;
@property (nonatomic) NSString *weight;
@property (nonatomic) NSString *powers;

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDictionary;

@end
