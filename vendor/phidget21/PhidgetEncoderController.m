#import "PhidgetEncoderController.h"


//Event callback functions for C, which in turn call a method on the GUI object in it's thread context

int gotAttach(CPhidgetHandle encoder, void *context) {
	NSLog(@"got attach");
	[(id)context performSelectorOnMainThread:@selector(phidgetAdded:)
								  withObject:nil
							   waitUntilDone:NO];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"is_attached" object:nil userInfo:@"is_attached"];
	
	return 0;
}


int gotDetach(CPhidgetHandle encoder, void *context) {
 	NSLog(@"got detach");
	[(id)context performSelectorOnMainThread:@selector(phidgetRemoved:)
								  withObject:nil
							   waitUntilDone:NO];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"is_detached" object:nil userInfo:@"is_detached"];
	return 0;
}

int gotInputChange(CPhidgetHandle encoder, void *context, int ind, int val){
	[(id)context performSelectorOnMainThread:@selector(InputChange:)
								  withObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:ind], [NSNumber numberWithInt:val], nil]
							   waitUntilDone:NO];
	return 0;
}

int gotPositionChange(CPhidgetEncoderHandle encoder, void *context, int ind, int time, int dir) {
 	NSLog(@"got position change");
	int position;
	CPhidgetEncoder_getPosition(encoder, ind, &position);
	
	NSDictionary *positionData = [[NSDictionary alloc] initWithObjectsAndKeys: 
									[NSNumber numberWithInt:position],
									@"position",
									nil];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"phidget_position_change" object:nil userInfo:positionData];
	
	
	return 0;
}



@implementation PhidgetEncoderController

- (CPhidgetEncoderHandle) createEncoder:(int)number
{
	CPhidgetEncoderHandle encoder;
	NSLog(@"From C - Create Encoder");
	NSLog(@"From C - the encoder ID is %d",number);
	int serial = number;
	CPhidgetEncoder_create(&encoder);
	CPhidget_open((CPhidgetHandle)encoder, serial);
	
	CPhidget_set_OnAttach_Handler((CPhidgetHandle)encoder, gotAttach, self);
	CPhidget_set_OnDetach_Handler((CPhidgetHandle)encoder, gotDetach, self);
	// CPhidgetEncoder_set_OnInputChange_Handler((CPhidgetHandle)encoder, gotInputChange, self);
	CPhidgetEncoder_set_OnPositionChange_Handler(encoder, gotPositionChange, self);
	return ((encoder));
	
}


//Reading the values from the added phidgets

- (void)phidgetAdded:(id)nothing
{
	NSLog(@"phidget added");
}	

- (int)getSerial:(CPhidgetEncoderHandle) encoder
{
	int serial;
	CPhidget_getSerialNumber((CPhidgetHandle)encoder, &serial);
	return serial;
}


- (void)phidgetRemoved:(id)nothing
{
	NSLog(@"phidget removed");
}

- (void)test
{
	NSLog(@"TEST");
	// CPhidgetInterfaceKit_create(120701);
 
}




- (void)phidgetClose:(id)nothing
{
	// CPhidget_close((CPhidgetHandle)encoder);
}


@end

