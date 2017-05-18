//
//  MTOnOffControl.m
//  MTOnOffControl
//
//  Created by muhammed tanriverdi on 21/04/2017.
//  Copyright © 2017 muhammed tanriverdi. All rights reserved.
//

#import "MTOnOffControl.h"

@implementation MTOnOffControl {
    CALayer *_imageLayer;
    UITapGestureRecognizer *_gestureRecognizer;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                     action:@selector(handleGesture:)];
        [self addGestureRecognizer:_gestureRecognizer];
        
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    _imageLayer = [CALayer layer];
    _imageLayer.contentsGravity = kCAGravityResizeAspect;
    _imageLayer.contents = (id) _offImage.CGImage;
    
    _imageLayer.bounds = self.bounds;
    _imageLayer.position = CGPointMake(CGRectGetWidth(self.bounds)/2.0, CGRectGetHeight(self.bounds)/2.0);
    
    [self.layer addSublayer:_imageLayer];
}

- (void)handleGesture:(UITapGestureRecognizer *)gesture
{
    [self setIsOn:!_isOn];
}

- (void) setIsOn : (BOOL) isOn {
    
    _isOn = isOn;
    
    [self updateUI];
}

- (void) updateUI {
    if(_isOn) {
        _imageLayer.contents = (id) _onImage.CGImage;
    } else {
        _imageLayer.contents = (id) _offImage.CGImage;
    }
}

- (void)updateFrame:(CGRect)frame {
    self.frame = frame;
    _imageLayer.bounds = self.bounds;
    _imageLayer.position = CGPointMake(CGRectGetWidth(self.bounds)/2.0, CGRectGetHeight(self.bounds)/2.0);
}

- (void) setOnImage : (UIImage *) onImage {
    _onImage = onImage;
    
    [self updateUI];
}

- (void) setOffImage : (UIImage *) offImage {
    _offImage = offImage;
    
    [self updateUI];
}
@end
