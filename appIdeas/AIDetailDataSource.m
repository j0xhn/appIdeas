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

// Can we go over this again?  I'm not comfortable with why we need to do this?
- (void)setIdea:(NSDictionary *)idea {
    _idea = idea;
    
    NSArray *voices = [[NSUserDefaults standardUserDefaults] objectForKey:idea[titleKey]];
    self.userVoices = voices;
}
// This one might be a little easier to understand, it's setting the object with the string from what it gets in "forKey"
- (void)setUserVoices:(NSArray *)userVoices {
    _userVoices = userVoices;
    
    [[NSUserDefaults standardUserDefaults] setObject:userVoices forKey:self.idea[titleKey]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// This is neccessary whenever you have a custom TableViewCell that you are going to be creating right? Am I understanding correctly?
- (void) registerTableView:(UITableView *)tableView{
    self.tableView = tableView;
    [tableView registerClass:[AIDetailTableViewCell class] forCellReuseIdentifier:VoiceCellKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.userVoices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // why can't I use a normal UITableView class here?  Why do I need to create a new one and register it?
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
    //sets our normal array to equal our mutabal array, HOW DOES THIS ADD AN EMPTY FIELD THOUGH?
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
    NSLog(@"You Clicked Done");
    [textField resignFirstResponder];
    return YES;
}


@end
