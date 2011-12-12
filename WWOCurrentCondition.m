//
//  WWOCurrentCondition.m
//  World Weather Online
//
//  Created by Trent Milton on 10/12/11.
//  Copyright (c) 2011 shaydes.dsgn. All rights reserved.
//

#import "WWOCurrentCondition.h"

@implementation WWOCurrentCondition

@synthesize observationTime;
@synthesize tempC, weatherCode, windspeedKmph, windspeed16Point, humidity, cloudCover, weatherDesc;

// Extra optional properties
@synthesize city;

@end
