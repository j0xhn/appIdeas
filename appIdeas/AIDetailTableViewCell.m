//
//  AIDetailTableViewCell.m
//  appIdeas
//
//  Created by John D. Storey on 5/29/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import "AIDetailTableViewCell.h"

@interface AIDetailTableViewCell ()

@property (nonatomic, strong) NSDictionary *voiceDetail;

@end

@implementation AIDetailTableViewCell

-(void) updateWithVoice:(NSDictionary *)voice idea:(NSDictionary *)idea{

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, 150, 30)];
        self.userNameField = textField;
        textField.placeholder = @"Name";
        [self.contentView addSubview:textField];
        
        UIButton *wantsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [wantsButton setTitle:@"Wants App" forState:UIControlStateNormal];
        [wantsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [wantsButton setTag:3];
        [wantsButton setFrame:CGRectMake(200, 8, 100, 30)];
        [wantsButton addTarget:self action:@selector(scoreButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:wantsButton];
        
        UIButton *mightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [mightButton setTitle:@"Might Use" forState:UIControlStateNormal];
        [mightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [mightButton setTag:2];
        [mightButton setFrame:CGRectMake(200, 38, 100, 30)];
        [mightButton addTarget:self action:@selector(scoreButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:mightButton];
        
        UIButton *wontButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [wontButton setTitle:@"Won't Use" forState:UIControlStateNormal];
        [wontButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [wontButton setTag:1];
        [wontButton setFrame:CGRectMake(200, 68, 100, 30)];
        [wontButton addTarget:self action:@selector(scoreButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:wontButton];
        
    }
    return self;
}

-(void) scoreButtonSelected:(id)sender{
//    NSLog(@"sender: %@", sender);
//    [self updateScore:[sender tag]];
//    
//    NSMutableDictionary *voiceDetail = [[NSMutableDictionary alloc] initWithDictionary:self.voiceDetailKey];
}

- (void) updateScore:(NSInteger *)score{
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
