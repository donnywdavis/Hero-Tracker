//
//  Character.h
//  Hero-Tracker
//
//  Created by Donny Davis on 4/22/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *middleName;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *height;
@property (nonatomic) NSString *weight;
@property (nonatomic) NSString *powers;
@property (nonatomic) NSString *abilities;
@property (nonatomic) NSString *smallImage;
@property (nonatomic) NSString *largeImage;

+ (Character *)characterWithDictionary:(NSDictionary *)heroDictionary;

@end
