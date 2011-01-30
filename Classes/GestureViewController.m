//
//  GestureViewController.m
//  GestureExperiment
//
//  Created by Boy van Amstel on 26-04-10.
//  Copyright 2010 boyvanamstel.nl. All rights reserved.
//

#import "GestureViewController.h"

@implementation GestureViewController

@synthesize infoLabel;
@synthesize labelX, labelY, labelZ;
@synthesize progressX, progressY, progressZ;
@synthesize threshold;
@synthesize accelerometer;
@synthesize locationManager;
@synthesize prevX, prevY, prevZ;
@synthesize audioPlayer;
@synthesize scream1, scream2, scream3, scream4, scream5, scream6;

- (void) devicePerformedAccelerometerAction:(AccererometerAction)theAction {
	switch (theAction) {
		case AccelerometerActionMoveToLeft:
			self.infoLabel.text = @"Moved to the left";
			NSLog(@"mleft");
			break;
		case AccelerometerActionMoveToRight:
			self.infoLabel.text = @"Moved to the right";
			NSLog(@"mright");
			break;
		case AccelerometerActionMoveUp:
			self.infoLabel.text = @"Moved up";
			NSLog(@"mup");
			break;
		case AccelerometerActionMoveDown:
			self.infoLabel.text = @"Moved down";
			NSLog(@"mdown");
			break;
		case AccelerometerActionRotateToLeft:
			self.infoLabel.text = @"Rotated to the left";
			NSLog(@"rleft");
			break;
		case AccelerometerActionRotateToRight:
			self.infoLabel.text = @"Rotated to the right";
			NSLog(@"rright");
			break;
		case AccelerometerActionShake:
			self.infoLabel.text = @"Shaken";
			NSLog(@"shaken");
			break;
		default:
			self.infoLabel.text = @"Unknown action";
			break;
	}
	[NSTimer scheduledTimerWithTimeInterval: 0.5 target:self selector:@selector(clearLabel:) userInfo:nil repeats:NO];
}

- (void) clearLabel:(NSTimer*)theTimer {
	self.infoLabel.text = @"No action";
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	labelX.text = [NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
	labelY.text = [NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
	labelZ.text = [NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];
	
	self.progressX.progress = ABS(acceleration.x);
	self.progressY.progress = ABS(acceleration.y);
	self.progressZ.progress = ABS(acceleration.z);

	float result = (self.prevZ - acceleration.z);
	
	if(result < -threshold.value) {
		int randomNr = 1 + random() % 3;
		NSLog(@"Forehand!");
		NSLog(@"%f - %f = %f", self.prevZ, acceleration.z , result);
		NSLog(@"Random: %i", randomNr);

		switch (randomNr) {
			case 1:
				self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:scream1] error:NULL];
				break;
			case 2:
				self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:scream2] error:NULL];
				break;
			case 3:
				self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:scream3] error:NULL];
				break;
			default:
				self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:scream6] error:NULL];
				break;
		}
		self.audioPlayer.delegate = self;
		[self.audioPlayer play];
	}
	if(result > threshold.value) {
		int randomNr = 4 + random() % 3;
		NSLog(@"Backhand!");
		NSLog(@"%f - %f = %f", self.prevZ, acceleration.z , result);
		NSLog(@"Random: %i", randomNr);
		
		switch (randomNr) {
			case 4:
				self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:scream4] error:NULL];
				break;
			case 5:
				self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:scream5] error:NULL];
				break;
			case 6:
				self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:scream6] error:NULL];
				break;
			default:
				self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:scream6] error:NULL];
				break;
		}
		self.audioPlayer.delegate = self;
		[self.audioPlayer play];
	}
	
	self.prevX = acceleration.x;
	self.prevY = acceleration.y;
	self.prevZ = acceleration.z;
}

// This delegate method is invoked when the location manager has heading data.
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)heading {
	/*
    // Update the labels with the raw x, y, and z values.
    [xLabel setText:[NSString stringWithFormat:@"%.1f", heading.x]];
    [yLabel setText:[NSString stringWithFormat:@"%.1f", heading.y]];
    [zLabel setText:[NSString stringWithFormat:@"%.1f", heading.z]];
    
    // Compute and display the magnitude (size or strength) of the vector.
    //      magnitude = sqrt(x^2 + y^2 + z^2)
    CGFloat magnitude = sqrt(heading.x*heading.x + heading.y*heading.y + heading.z*heading.z);
    [magnitudeLabel setText:[NSString stringWithFormat:@"%.1f", magnitude]];
    
    // Update the graph with the new magnetic reading.
    [graphView updateHistoryWithX:heading.x y:heading.y z:heading.z];
	 */
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	// For AccelerometerActions uncomment #1, comment #2
	
	// AccelerometerActions
	/* #1
	[[AccelerometerActions sharedAccelerometerActions] setDelegate:self];
	[[AccelerometerActions sharedAccelerometerActions] startSendingActions];
	#1 */
	
	// #2
	self.accelerometer = [UIAccelerometer sharedAccelerometer];
	self.accelerometer.updateInterval = .1;
	self.accelerometer.delegate = self;
	// #2
	
	self.prevX = 0.0;
	self.prevY = 0.0;
	self.prevZ = 0.0;
	
	self.locationManager = [[[CLLocationManager alloc] init] autorelease];
    // check if the hardware has a compass
	if (locationManager.headingAvailable == NO) {
		// No compass is available. This application cannot function without a compass, 
		// so a dialog will be displayed and no magnetic data will be measured.
		self.locationManager = nil;
		//UIAlertView *noCompassAlert = [[UIAlertView alloc] initWithTitle:@"No Compass!" message:@"This device does not have the ability to measure magnetic fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		//[noCompassAlert show];
		//[noCompassAlert release];
	} else {
		// heading service configuration
		locationManager.headingFilter = kCLHeadingFilterNone;

		// setup delegate callbacks
		locationManager.delegate = self;

		// start the compass
		[locationManager startUpdatingHeading];
	}	
	
	// Setup audio paths
	self.scream1 = [[NSBundle mainBundle] pathForResource:@"screamHigh1" ofType:@"mp3"];  
	self.scream2 = [[NSBundle mainBundle] pathForResource:@"screamHigh2" ofType:@"mp3"];  
	self.scream3 = [[NSBundle mainBundle] pathForResource:@"screamMan3" ofType:@"mp3"];  
	self.scream4 = [[NSBundle mainBundle] pathForResource:@"screamLow4" ofType:@"mp3"];  
	self.scream5 = [[NSBundle mainBundle] pathForResource:@"screamLow5" ofType:@"mp3"];  
	self.scream6 = [[NSBundle mainBundle] pathForResource:@"screamMan6" ofType:@"mp3"];  
	
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[accelerometer release];
	[locationManager release];
	[audioPlayer release];
	[scream1 release];
	[scream2 release];
	[scream3 release];
	[scream4 release];
	[scream5 release];
	[scream6 release];
    [super dealloc];
}


@end
