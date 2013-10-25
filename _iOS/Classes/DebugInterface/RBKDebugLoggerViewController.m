//
//  RBKDebugLoggerViewController.m
//  RBKDebugLogger
//
//  Created by Stephen Gazzard on 2013-10-25.
//  Copyright (c) 2013 Stephen Gazzard. All rights reserved.
//

#import "RBKDebugLoggerViewController.h"
#import "RBKDebugSession.h"
#import "RBKLogMessage.h"
#import <NSManagedObject+MagicalRecord.h>
#import <NSManagedObject+MagicalFinders.h>

@interface RBKDebugLoggerViewController ()

@property (weak, nonatomic) IBOutlet UITableView *logsTableView, *categoriesTableView, *sessionsTableView, *levelsTableView;

@property (strong, nonatomic) NSMutableSet *allCategories, *allLevels;
@property (strong, nonatomic) NSArray *logs, *sessions, *sortedCategories, *sortedLevels;
@property (strong, nonatomic) NSMutableSet *selectedSessions, *ignoredCategories, *ignoredLevels;

@end

@implementation RBKDebugLoggerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _allCategories = [NSMutableSet set];
        _allLevels = [NSMutableSet set];
        _selectedSessions = [NSMutableSet set];
        _ignoredCategories = [NSMutableSet set];
        _ignoredLevels = [NSMutableSet set];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadSessions];
    [self reloadLogs];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadSessions {
    self.sessions = [RBKDebugSession MR_findAllSortedBy:@"startDate" ascending:NO];
    [self.sessionsTableView reloadData];
    [self.selectedSessions addObject:[self.sessions lastObject]];
}

- (void)reloadLogs {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"!(%K in %@) && !(%K in %@) && (%K in %@)",
                              @"category", self.ignoredCategories,
                              @"level", self.ignoredLevels,
                              @"session", self.selectedSessions];
    self.logs = [RBKLogMessage MR_findAllSortedBy:@"timestamp" ascending:NO withPredicate:predicate];
    
    for(RBKLogMessage *logMessage in self.logs) {
        if(logMessage.category.length) {
            [self.allCategories addObject:logMessage.category];
        }
        [_allLevels addObject:logMessage.level];
    }
    self.sortedCategories = [self.allCategories.allObjects sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    self.sortedLevels = [self.allLevels.allObjects sortedArrayUsingSelector:@selector(compare:)];
    [self.logsTableView reloadData];
    [self.categoriesTableView reloadData];
}

#pragma mark - Events

- (IBAction)close:(id)sender {
    if(self.delegate && [self.delegate respondsToSelector:@selector(debugLoggerViewControllerDidTapClose:)]) {
        [self.delegate debugLoggerViewControllerDidTapClose:self];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - UITableViewDelegate/UITableViewDataSource implementations

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.sessionsTableView) {
        return [self.sessions count];
    } else if(tableView == self.logsTableView) {
        return [self.logs count];
    } else if(tableView == self.categoriesTableView) {
        return [self.sortedCategories count];
    } else if(tableView == self.levelsTableView) {
        return [self.sortedLevels count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"StandardCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    if(tableView == self.sessionsTableView) {
        RBKDebugSession *session = self.sessions[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", session.startDate, session.endDate ? session.endDate : @""];
        cell.accessoryType = ([self.selectedSessions containsObject:session] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone);
    } else if(tableView == self.logsTableView) {
        RBKLogMessage *log = self.logs[indexPath.row];
        cell.textLabel.text = log.message;
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else if(tableView == self.categoriesTableView) {
        NSString *category = self.sortedCategories[indexPath.row];
        cell.textLabel.text = category;
        cell.accessoryType = ([self.ignoredCategories containsObject:category] ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark);
    } else if(tableView == self.levelsTableView) {
        NSNumber *level = self.sortedLevels[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", level];
        cell.accessoryType = ([self.ignoredLevels containsObject:level] ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark);
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView == self.sessionsTableView) {
        RBKDebugSession *session = self.sessions[indexPath.row];
        [self.selectedSessions containsObject:session] ? [self.selectedSessions removeObject:session] : [self.selectedSessions addObject:session];
    } else if(tableView == self.categoriesTableView) {
        NSString *category = self.sortedCategories[indexPath.row];
        [self.ignoredCategories containsObject:category] ? [self.ignoredCategories removeObject:category] : [self.ignoredCategories addObject:category];
    } else if(tableView == self.levelsTableView) {
        NSNumber *level = self.sortedLevels[indexPath.row];
        [self.ignoredLevels containsObject:level] ? [self.ignoredLevels removeObject:level] : [self.ignoredLevels addObject:level];
    }
    [self reloadLogs];
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
