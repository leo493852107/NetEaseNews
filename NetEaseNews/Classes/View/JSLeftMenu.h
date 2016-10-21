//
//  JSLeftMenu.h
//  NetEaseNews
//
//  Created by leo on 20/10/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JSLeftMenu;

@protocol JSLeftMenuDelegate <NSObject>

@optional
- (void)leftMenu:(JSLeftMenu *)menu didSelectButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

@end

@interface JSLeftMenu : UIView
/** delegate */
@property (nonatomic, weak) id<JSLeftMenuDelegate> delegate;

@end
