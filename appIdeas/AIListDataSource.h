//
//  AIListDataSource.h
//  appIdeas
//
//  Created by John D. Storey on 5/28/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIListDataSource : NSObject <UITableViewDataSource>
@property (strong, nonatomic) NSString *identifier;
@property (nonatomic, strong, readonly) NSArray *ideas;

- (void)registerTableView:(UITableView *)tableView;
- (void)newIdea;

@end
