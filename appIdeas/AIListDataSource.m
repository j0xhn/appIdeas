//
//  AIListDataSource.m
//  appIdeas
//
//  Created by John D. Storey on 5/28/14.
//  Copyright (c) 2014 d. All rights reserved.
//

#import "AIListDataSource.h"
#import "AITableViewCell.h"
// creates a private use of AIListDataSource and the delegate lets the Text Field Change itself
@interface AIListDataSource () <UITextFieldDelegate>
//defines variables
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *ideas;

@end

static NSString * const ListCellKey = @"listCell";
static NSString * const PersistentListKey = @"persistentList";

@implementation AIListDataSource
//?WIT I understand "match a user’s preferences" but how do we use it in our app?
- (id)init {
    
    self = [super init];
    if (self) {
        
        NSArray *list = [[NSUserDefaults standardUserDefaults] objectForKey:PersistentListKey];
        self.ideas = list;
        
    }
    return self;
}
// ?WIT Wher is this first occurence spoken of in "Returns the object associated with the first occurrence of the specified default."
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
    
    NSString *identifier = [NSString stringWithFormat:@"Cell %d", indexPath.row];
    AITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.titleField.tag = indexPath.row;
    cell.titleField.delegate = self;
    [cell updateWithIdea:self.ideas[indexPath.row]];
    
    return cell;
    
}
// creates cell for editing
-(void) newIdea {
    NSLog(@"Data Source: you want to add an idea");
    
    [self.tableView reloadData];
    
    NSMutableArray *mutableIdeas = [NSMutableArray arrayWithObject:@""];
    [mutableIdeas addObjectsFromArray:self.ideas];
    self.ideas = [NSMutableArray arrayWithArray:mutableIdeas];
    //? Wouldn't we need to reload the view?
}

@end
