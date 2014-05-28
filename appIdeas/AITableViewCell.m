//
//  AITableViewCell.m
//  appIdeas
//
//  Created by John D. Storey on 5/28/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import "AITableViewCell.h"

static CGFloat margin = 45;

@interface AITableViewCell ()

@property (nonatomic, strong) UITextField *titleField;

@end

@implementation AITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(margin, 0, self.contentView.bounds.size.width - margin , self.contentView.bounds.size.height)];
        textField.placeholder = @"App Idea";
        self.titleField = textField;
        [self.contentView addSubview:textField];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void) updateWithIdea:(NSString *)idea{
    self.titleField.text = idea;
}

@end
