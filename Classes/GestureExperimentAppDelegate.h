//
//  GestureExperimentAppDelegate.h
//  GestureExperiment
//
//  Created by Boy van Amstel on 26-04-10.
//  Copyright boyvanamstel.nl 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GestureViewController;

@interface GestureExperimentAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	GestureViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) GestureViewController *viewController;

@end

