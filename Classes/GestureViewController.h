//
//  GestureViewController.h
//  GestureExperiment
//
//  Created by Boy van Amstel on 26-04-10.
//  Copyright 2010 boyvanamstel.nl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AVFoundation/AVFoundation.h>
#import "AccelerometerActions.h"

@interface GestureViewController : UIViewController <AccelerometerActionsDelegate,UIAccelerometerDelegate,CLLocationManagerDelegate,AVAudioPlayerDelegate> {
	UILabel *infoLabel;
	
	UILabel *labelX;
	UILabel *labelY;
	UILabel *labelZ;
	
	UIProgressView *progressX;
	UIProgressView *progressY;
	UIProgressView *progressZ;
	
	UISlider *threshold;
	
	UIAccelerometer *accelerometer;
	CLLocationManager *locationManager;
	
	float prevX;
	float prevY;
	float prevZ;	
	
	AVAudioPlayer *audioPlayer;	
	
	NSString *scream1;
	NSString *scream2;
	NSString *scream3;
	NSString *scream4;
	NSString *scream5;
	NSString *scream6;
}

@property (nonatomic, retain) IBOutlet UILabel *infoLabel;

@property (nonatomic, retain) IBOutlet UILabel *labelX;
@property (nonatomic, retain) IBOutlet UILabel *labelY;
@property (nonatomic, retain) IBOutlet UILabel *labelZ;

@property (nonatomic, retain) IBOutlet UIProgressView *progressX;
@property (nonatomic, retain) IBOutlet UIProgressView *progressY;
@property (nonatomic, retain) IBOutlet UIProgressView *progressZ;

@property (nonatomic, retain) IBOutlet UISlider *threshold;

@property (nonatomic, retain) UIAccelerometer *accelerometer;
@property (nonatomic, retain) CLLocationManager *locationManager;

@property float prevX;
@property float prevY;
@property float prevZ;

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;	

@property (nonatomic, retain) NSString *scream1;
@property (nonatomic, retain) NSString *scream2;
@property (nonatomic, retain) NSString *scream3;
@property (nonatomic, retain) NSString *scream4;
@property (nonatomic, retain) NSString *scream5;
@property (nonatomic, retain) NSString *scream6;


@end
