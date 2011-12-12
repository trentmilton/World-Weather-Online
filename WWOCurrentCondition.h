//
//  WWOCurrentCondition.h
//  World Weather Online
//
//  Created by Trent Milton on 10/12/11.
//  Copyright (c) 2011 shaydes.dsgn. All rights reserved.
//

@interface WWOCurrentCondition : NSObject

@property (nonatomic, retain) NSString *observationTime;
@property (nonatomic) int tempC;
@property (nonatomic) int weatherCode;
@property (nonatomic, retain) NSString *weatherDesc;
@property (nonatomic) int windspeedKmph;
@property (nonatomic, retain) NSString * windspeed16Point;
@property (nonatomic) int humidity;
@property (nonatomic) int cloudCover;

// Extra optional properties
@property (nonatomic, retain) NSString *city;

@end
