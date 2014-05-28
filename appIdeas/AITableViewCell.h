//
//  AITableViewCell.h
//  appIdeas
//
//  Created by John D. Storey on 5/28/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AITableViewCell : UITableViewCell
//?WIT why create a "read only" version that's public
@property (nonatomic, strong, readonly) UITextField *titleField;

- (void)updateWithIdea:(NSString *)idea;

@end
