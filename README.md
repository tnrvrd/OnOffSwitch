# OnOffSwitch

## Installation

You can copy two files (MTOnOffControl.h/.m) into your project and start to use.

## Code Example

1-You can create an MTOnOffControl with a view's frame which you want to show in. 
```
MTOnOffControl *onOffControl = [[MTOnOffControl alloc] initWithFrame:self.onOffView.bounds];
```

2-You can set the on/off images. 
```
onOffControl = [UIImage imageNamed:@"1_on.png"];
```
```
onOffControl = [UIImage imageNamed:@"1_off.png"];
```

3-You need to add the control as a subview in view. 
```
[self.onOffView addSubview:onOffControl];
```

You can add an observer for the value(isOn) changed. 
```
[onOffControl addObserver:self forKeyPath:@"isOn" options:0 context:NULL];
```

## Screenshots

![portrait](https://github.com/muhammedtanriverdi/OnOffSwitch/blob/master/screenshot_portrait.png)
![landscape](https://github.com/muhammedtanriverdi/OnOffSwitch/blob/master/screenshot_landscape.png)


