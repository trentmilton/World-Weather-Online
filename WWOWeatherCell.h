//
//  WWOWeatherCell.h
//  World Weather Online
//
//  Created by Trent Milton on 10/12/11.
//  Copyright (c) 2011 shaydes.dsgn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWOWeatherCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *date;
@property (nonatomic, retain) IBOutlet UILabel *tempMaxC;
@property (nonatomic, retain) IBOutlet UILabel *tempMinC;
@property (nonatomic, retain) IBOutlet UILabel *weatherCode;
@property (nonatomic, retain)  IBOutlet UILabel *weatherDesc;

@end
