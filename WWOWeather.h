//
//  WWOForecast.h
//  World Weather Online
//
//  Created by Trent Milton on 10/12/11.
//  Copyright (c) 2011 shaydes.dsgn. All rights reserved.
//

#import "WWOWeatherCell.h"

@interface WWOWeather : NSObject

@property (nonatomic, retain) NSString *date;
@property (nonatomic) int tempMaxC;
@property (nonatomic) int tempMinC;
@property (nonatomic) int weatherCode;

- (WWOWeatherCell *) getCell:(UITableView *)tableView;

@end
