//
//  WWOHelper.h
//  World Weather Online
//
//  Helper for the http://www.worldweatheronline.com api
//
//  Created by Trent Milton on 10/12/11.
//  Copyright (c) 2011 shaydes.dsgn. All rights reserved.
//

#import "TBXML.h"
#import "WWOWeather.h"
#import "WWOCurrentCondition.h"

@interface WWOHelper : NSObject

+ (WWOCurrentCondition *) getCurrentCondition;
+ (NSArray *) getWeatherByCoordinates:(float)latitude longitude:(float)longitude apiKey:(NSString *)apiKey;

@end
