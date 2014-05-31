//
//  AIDetailDataSource.m
//  appIdeas
//
//  Created by John D. Storey on 5/28/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import "AIDetailDataSource.h"
#import "AIDetailTableViewCell.h"

static NSString * const VoiceCellKey = @"voiceCell";
static NSString * const titleKey = @"title";
static NSString * const userNameKey = @"userName";
static NSString * const scoreKey = @"score";

@interface AIDetailDataSource () <UITextFieldDelegate>
@property (nonatomic,strong) NSArray *userVoices;
@property (nonatomic,strong) UITableView *tableView;
@end
@implementation AIDetailDataSource

- (void)setIdea:(NSDictionary *)idea {
    _idea = idea;
    
    NSArray *voices = [[NSUserDefaults standardUserDefaults] objectForKey:idea[titleKey]];
    self.userVoices = voices;
}

- (void)setUserVoices:(NSArray *)userVoices {
    _userVoices = userVoices;
    
    [[NSUserDefaults standardUserDefaults] setObject:userVoices forKey:self.idea[titleKey]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// This is neccessary anytime you have a deque with a reuseable identifier
- (void) registerTableView:(UITableView *)tableView{
    self.tableView = tableView;
    [tableView registerClass:[AIDetailTableViewCell class] forCellReuseIdentifier:VoiceCellKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.userVoices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    AIDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VoiceCellKey];
    [cell updateWithVoice:self.userVoices[indexPath.row] idea:self.idea];
    cell.userNameField.delegate = self;
    
    return cell;
}

-(void)newVoice{
    [self.tableView reloadData];
    
    NSMutableArray *mutableVoices = [NSMutableArray arrayWithObject:@{userNameKey:@"", scoreKey:@(0)}];
    //adds objects from userVoices into our mutable array
    [mutableVoices addObjectsFromArray:self.userVoices];
    // ? Sets our normal array to equal our mutabal array, HOW DOES THIS ADD AN EMPTY FIELD THOUGH?
    self.userVoices = [NSArray arrayWithArray:mutableVoices];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSInteger index = textField.tag;
    
    NSMutableDictionary *voice = [[NSMutableDictionary alloc] initWithDictionary:self.userVoices[index]];
    [voice setObject:textField.text forKey:userNameKey];
    
    NSMutableArray *mutableVoices = [NSMutableArray arrayWithArray:self.userVoices];
    [mutableVoices replaceObjectAtIndex:index withObject:voice];
    
    self.userVoices = [NSArray arrayWithArray:mutableVoices];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
