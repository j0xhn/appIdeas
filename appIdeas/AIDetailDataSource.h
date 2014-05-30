//
//  AIDetailDataSource.h
//  appIdeas
//
//  Created by John D. Storey on 5/28/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIDetailDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *idea;

- (void)registerTableView:(UITableView *)tableView;
- (void)newVoice;

@end
