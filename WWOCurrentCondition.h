//
//  WWOCurrentCondition.h
//  RainReminder
//
//  Created by Trent Milton on 10/12/11.
//  Copyright (c) 2011 shaydes.dsgn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWOCurrentCondition : NSObject

@property (nonatomic, retain) NSString *observationTime;
@property (nonatomic) int tempC;
@property (nonatomic) int weatherCode;
@property (nonatomic) int windspeedKmph;
@property (nonatomic) int windspeed16Point;
@property (nonatomic) int humidity;
@property (nonatomic) int cloudCover;

@end
