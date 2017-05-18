//
//  MTOnOffControl.h
//  MTOnOffControl
//
//  Created by muhammed tanriverdi on 21/04/2017.
//  Copyright © 2017 muhammed tanriverdi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTOnOffControl : UIControl

@property(assign, nonatomic) BOOL isOn;
@property(strong, nonatomic) UIImage *onImage;
@property(strong, nonatomic) UIImage *offImage;

- (void) updateFrame : (CGRect) frame;

@end
