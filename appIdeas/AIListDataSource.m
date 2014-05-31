//
//  AIListDataSource.m
//  appIdeas
//
//  Created by John D. Storey on 5/28/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import "AIListDataSource.h"
#import "AITableViewCell.h"

static NSString * const ListCellKey = @"listCell";
static NSString * const PersistentListKey = @"persistentList";
static NSString * const titleKey = @"title";

// creates a private use of AIListDataSource and the delegate lets the Text Field Change itself
@interface AIListDataSource () <UITextFieldDelegate>
//defines variables
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *ideas;
@property (nonatomic, strong) NSMutableDictionary *idea;

@end

@implementation AIListDataSource

- (id)init {
    
    self = [super init];
    if (self) {
        
        self.ideas = [[NSUserDefaults standardUserDefaults] objectForKey:PersistentListKey];
        
    }
    return self;
}

- (void)setIdeas:(NSArray *)ideas {
    _ideas = ideas;
    
    [[NSUserDefaults standardUserDefaults] setObject:ideas forKey:PersistentListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
// sets our Table View as the destination of our DataSource, needed when we have a custom TableViewCell?
- (void)registerTableView:(UITableView *)tableView {
    self.tableView = tableView;
    [tableView registerClass:[AITableViewCell class] forCellReuseIdentifier:ListCellKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.ideas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    AITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ListCellKey];
    cell.titleField.tag = indexPath.row;
    cell.titleField.delegate = self;
    [cell updateWithIdea:self.ideas[indexPath.row]];
    
    return cell;
    
}
// creates cell for editing
-(void) newIdea {
    NSLog(@"Data Source: you want to add an idea");
        // In order to save the cell if still editing we need to resign the responder and have the delegate methods called. So we reload the tableview before adding another idea
    [self.tableView reloadData];
    
    NSMutableArray *mutableIdeas = [NSMutableArray arrayWithObject:@{titleKey: @""}];
    [mutableIdeas addObjectsFromArray:self.ideas];
    self.ideas = [NSMutableArray arrayWithArray:mutableIdeas];
    //? Wouldn't we need to reload the view?
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSInteger index = textField.tag;
    NSMutableDictionary *idea = [[NSMutableDictionary alloc] initWithDictionary:self.ideas[index]];
    [idea setObject:textField.text forKey:titleKey];
    
    NSMutableArray *mutableIdeas = [NSMutableArray arrayWithArray:self.ideas];
    [mutableIdeas replaceObjectAtIndex:index withObject:idea];
    self.ideas = [NSArray arrayWithArray:mutableIdeas];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"you clicked return");
    [textField resignFirstResponder];
    return YES;
}

@end
