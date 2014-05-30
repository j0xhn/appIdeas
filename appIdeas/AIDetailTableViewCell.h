//
//  AIDetailTableViewCell.h
//  appIdeas
//
//  Created by John D. Storey on 5/29/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIDetailTableViewCell : UITableViewCell

@property (nonatomic, strong) UITextField *userNameField;

- (void)updateWithVoice:(NSDictionary *)voice idea:(NSDictionary *)idea;

@end
