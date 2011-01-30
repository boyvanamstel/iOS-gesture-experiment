//
//  GestureExperimentAppDelegate.m
//  GestureExperiment
//
//  Created by Boy van Amstel on 26-04-10.
//  Copyright boyvanamstel.nl 2010. All rights reserved.
//

#import "GestureExperimentAppDelegate.h"
#import "GestureViewController.h"

@implementation GestureExperimentAppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

	GestureViewController *newViewController = [[[GestureViewController alloc] initWithNibName:@"GestureViewController" bundle:nil] autorelease];
	
	self.viewController = newViewController;
	
	[window addSubview:[self.viewController view]];
		
    // Override point for customization after application launch
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
	[viewController release];
    [super dealloc];
}


@end
