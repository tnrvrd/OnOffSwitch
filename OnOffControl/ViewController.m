//
//  ViewController.m
//  OnOffControl
//
//  Created by muhammed tanriverdi on 21/04/2017.
//  Copyright © 2017 muhammed tanriverdi. All rights reserved.
//

#import "ViewController.h"
#import "MTOnOffControl.h"

@interface ViewController () {
    MTOnOffControl *_onOffControlTop;
    MTOnOffControl *_onOffControlMiddle;
    MTOnOffControl *_onOffControlBottom;
}

@end

@implementation ViewController

typedef enum OnOffControlType {
    TOP,
    MIDDLE,
    BOTTOM
}OnOffControlType;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create OnOffControl objects
    _onOffControlTop = [[MTOnOffControl alloc] initWithFrame:self.onOffViewTop.bounds];
    _onOffControlMiddle = [[MTOnOffControl alloc] initWithFrame:self.onOffViewMiddle.bounds];
    _onOffControlBottom = [[MTOnOffControl alloc] initWithFrame:self.onOffViewBottom.bounds];
    
    // Set images of controls
    _onOffControlTop.onImage = [UIImage imageNamed:@"3_on.png"];
    _onOffControlTop.offImage = [UIImage imageNamed:@"3_off.png"];
    _onOffControlMiddle.onImage = [UIImage imageNamed:@"2_on.png"];
    _onOffControlMiddle.offImage = [UIImage imageNamed:@"2_off.png"];
    _onOffControlBottom.onImage = [UIImage imageNamed:@"1_on.png"];
    _onOffControlBottom.offImage = [UIImage imageNamed:@"1_off.png"];
    
    // Add objects' view 
    [self.onOffViewTop addSubview:_onOffControlTop];
    [self.onOffViewMiddle addSubview:_onOffControlMiddle];
    [self.onOffViewBottom addSubview:_onOffControlBottom];
    
    // Assign tags
    _onOffControlTop.tag = TOP;
    _onOffControlMiddle.tag = MIDDLE;
    _onOffControlBottom.tag = BOTTOM;
    
    // Add observers
    [_onOffControlTop addObserver:self forKeyPath:@"isOn" options:0 context:NULL];
    [_onOffControlMiddle addObserver:self forKeyPath:@"isOn" options:0 context:NULL];
    [_onOffControlBottom addObserver:self forKeyPath:@"isOn" options:0 context:NULL];
}

- (void)viewDidLayoutSubviews {
    
    // Update for auto-layout, OnOffControl objects' frames need to update
    [_onOffControlTop updateFrame : self.onOffViewTop.bounds];
    [_onOffControlMiddle updateFrame : self.onOffViewMiddle.bounds];
    [_onOffControlBottom updateFrame : self.onOffViewBottom.bounds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if([keyPath isEqualToString:@"isOn"] && [object isKindOfClass:[MTOnOffControl class]]) {
        
        bool isOn = ((MTOnOffControl *)object).isOn;
        NSInteger tag = ((MTOnOffControl *)object).tag;
        
        switch ((OnOffControlType)tag) {
            case TOP:
                NSLog(@"top : %d", isOn);
                break;
            case MIDDLE:
                NSLog(@"middle : %d", isOn);
                break;
            case BOTTOM:
                NSLog(@"bottom : %d", isOn);
                break;
            default:
                break;
        }
    }
}

@end
