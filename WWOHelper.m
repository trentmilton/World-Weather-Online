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
static NSString *weatherCodesURLString = @"http://www.worldweatheronline.com/feed/wwoConditionCodes.xml";

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
    currentCondition.weatherDesc = [TBXML textForElement:[TBXML childElementNamed:@"weatherDesc" parentElement:currentConditionElement]];
    currentCondition.windspeedKmph = [[TBXML textForElement:[TBXML childElementNamed:@"windspeedKmph" parentElement:currentConditionElement]] intValue];
    currentCondition.windspeed16Point = [TBXML textForElement:[TBXML childElementNamed:@"winddir16Point" parentElement:currentConditionElement]];
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
        
        TBXMLElement *weatherDescElement = [TBXML childElementNamed:@"weatherDesc" parentElement:weatherElement];
        weather.weatherDesc = [TBXML textForElement:weatherDescElement];
        
        [weathers addObject:weather];
            
    } while ((weatherElement = weatherElement->nextSibling));      

    return weathers;

}

+ (NSArray *) getWeatherCodes 
{
    NSURL *url = [NSURL URLWithString:weatherCodesURLString];
    TBXML *tbxml = [TBXML tbxmlWithURL:url];
    TBXMLElement *root = tbxml.rootXMLElement;
    TBXMLElement *conditionElement = [TBXML childElementNamed:@"condition" parentElement:root];
    NSMutableArray *weatherCodes = [[NSMutableArray alloc] init];
    do {
        WWOWeatherCode *weatherCode = [[WWOWeatherCode alloc] init];
        weatherCode.code = [[TBXML textForElement:[TBXML childElementNamed:@"code" parentElement:conditionElement]] intValue];
        weatherCode.description = [TBXML textForElement:[TBXML childElementNamed:@"description" parentElement:conditionElement]];
        [weatherCodes addObject:weatherCode];
    } while ((conditionElement = conditionElement->nextSibling));
    return weatherCodes;
}

@end
