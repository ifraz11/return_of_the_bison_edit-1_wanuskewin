/* PhidgetEncoderController */

#import <Cocoa/Cocoa.h>
#import </Library/Frameworks/Phidget21.framework/Headers/phidget21.h>

@interface PhidgetEncoderController : NSObject
{
	
}

//Phidget functions
//- (void)OutputChange:(NSArray *)outputChangeData;
//- (void)InputChange:(NSArray *)inputChangeData;
// - (void)SensorChange:(NSArray *)sensorChangeData;
- (CPhidgetEncoderHandle)createEncoder:(int)serial;

- (void)phidgetAdded:(id)nothing;
- (void)phidgetRemoved:(id)nothing;



@end
