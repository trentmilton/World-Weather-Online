//
//  WWOHelper.m
//  World Weather Online
//
//  Created by Trent Milton on 10/12/11.
//  Copyright (c) 2011 shaydes.dsgn. All rights reserved.
//

#import "WWOHelper.h"

@implementation WWOHelper

static WWOCurrentCondition *currentCondition;

+ (WWOCurrentCondition *) getCurrentCondition
{
    if (currentCondition)
    {
        return currentCondition;
    }
    return nil;
}

+ (NSArray *) getWeatherByCoordinates:(float)latitude longitude:(float)longitude apiKey:(NSString *)apiKey 
{
    NSString *urlString = [NSString stringWithFormat:@"http://free.worldweatheronline.com/feed/weather.ashx?key=%@&q=%f,%f&format=xml&num_of_days=5",
                     apiKey, latitude, longitude];
    NSURL *url = [NSURL URLWithString:urlString];
    TBXML *tbxml = [TBXML tbxmlWithURL:url];
    TBXMLElement *root = tbxml.rootXMLElement;
    
    TBXMLElement *currentConditionElement = [TBXML childElementNamed:@"current_condition" parentElement:root];
    
    currentCondition = [[WWOCurrentCondition alloc] init];
    currentCondition.observationTime = [TBXML textForElement:[TBXML childElementNamed:@"observation_time" parentElement:currentConditionElement]];
    currentCondition.tempC = [[TBXML textForElement:[TBXML childElementNamed:@"temp_C" parentElement:currentConditionElement]] intValue];
    currentCondition.weatherCode = [[TBXML textForElement:[TBXML childElementNamed:@"weatherCode" parentElement:currentConditionElement]] intValue];
    currentCondition.windspeedKmph = [[TBXML textForElement:[TBXML childElementNamed:@"windspeedKmph" parentElement:currentConditionElement]] intValue];
    currentCondition.windspeed16Point = [[TBXML textForElement:[TBXML childElementNamed:@"winddir16Point" parentElement:currentConditionElement]] intValue];
    currentCondition.humidity = [[TBXML textForElement:[TBXML childElementNamed:@"humidity" parentElement:currentConditionElement]] intValue];
    currentCondition.cloudCover = [[TBXML textForElement:[TBXML childElementNamed:@"cloudcover" parentElement:currentConditionElement]] intValue];   
    
    TBXMLElement *weatherElement = [TBXML childElementNamed:@"weather" parentElement:root];
    NSMutableArray *weathers = [[NSMutableArray alloc] init];
    do
    {
        WWOWeather *weather = [[WWOWeather alloc] init];
        
        TBXMLElement *dateElement = [TBXML childElementNamed:@"date" parentElement:weatherElement];
        weather.date = [TBXML textForElement:dateElement];
        
        TBXMLElement *tempMaxCElement = [TBXML childElementNamed:@"tempMaxC" parentElement:weatherElement];
        weather.tempMaxC = [[TBXML textForElement:tempMaxCElement] intValue];
        
        TBXMLElement *tempMinCElement = [TBXML childElementNamed:@"tempMinC" parentElement:weatherElement];
        weather.tempMinC = [[TBXML textForElement:tempMinCElement] intValue];

        TBXMLElement *weatherCodeElement = [TBXML childElementNamed:@"weatherCode" parentElement:weatherElement];
        weather.weatherCode = [[TBXML textForElement:weatherCodeElement] intValue];
        
        [weathers addObject:weather];
            
    } while ((weatherElement = weatherElement->nextSibling));      
    //NSLog(@"weathers length = %i", [weathers count]);
    return weathers;

}

@end
