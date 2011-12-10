//
//  WWOForecast.m
//  World Weather Online
//
//  Created by Trent Milton on 10/12/11.
//  Copyright (c) 2011 shaydes.dsgn. All rights reserved.
//

#import "WWOWeather.h"

@implementation WWOWeather

@synthesize date;
@synthesize tempMaxC, tempMinC, weatherCode;

- (WWOWeatherCell *) getCell:(UITableView *)tableView
{
    WWOWeatherCell *cell = (WWOWeatherCell *)[tableView dequeueReusableCellWithIdentifier:@"WWOWeatherCell"];
    cell.date.text = date;
    cell.tempMaxC.text = [[NSString alloc] initWithFormat:@"%i", tempMaxC];
    cell.tempMinC.text = [[NSString alloc] initWithFormat:@"%i", tempMinC];
    cell.weatherCode.text = [[NSString alloc] initWithFormat:@"%i", weatherCode];
    return cell;
}

@end
