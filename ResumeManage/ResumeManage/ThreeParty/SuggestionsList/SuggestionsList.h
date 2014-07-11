//
//  SuggestionMenu.h
//  AutoComplete
//
//  Created by McLiang on 07/16/2012.
//  Copyright 2012 http://15045050837@126.com . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestionsList : UITableViewController 

-(id)initWithArray:(NSArray*)array;
-(void)showSuggestionsFor:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string;

@property(retain)NSArray *stringsArray;
@property(retain)NSArray *matchedStrings;
@property(retain)UIPopoverController *popOver;

@property(assign)UITextField *activeTextField;
@end
