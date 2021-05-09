//
//  Circle.m
//  ObjCFundamentals_Task1
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import "Circle.h"

@implementation Circle

- (instancetype)initWithRadius:(float)radius {
    if (radius >= 0) {
        self = [super init];
        if (self) {
            _radius = radius;
            pi = 3.14;
        }
        return self;
    }
    return nil;
}

+ (Circle *)createCircle{
    Circle *circle = [[Circle alloc] initWithRadius:0];
    return circle;
}

- (float)area {
    return _radius * _radius * pi;
}

- (float)perimeter {
    return 2 * pi * _radius;
}

@end
