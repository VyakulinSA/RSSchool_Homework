//
//  Triangle.m
//  ObjCFundamentals_Task1
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import "Triangle.h"

@implementation Triangle

- (instancetype)initWithSides_aSide:(float)aSide bSide:(float)bSide cSide:(float)cSide {
    if ((aSide<0 || bSide<0 || cSide<0) || (aSide >= bSide + cSide)){
        return nil;
    }
    self = [super init];
    if (self) {
        _aSide = aSide;
        _bSide = bSide;
        _cSide = cSide;
    }
    return self;
}

+ (Triangle *)createTriangleWithSides_aSide:(float)aSide bSide:(float)bSide cSide:(float)cSide{
    Triangle *triangle = [[Triangle alloc] initWithSides_aSide:aSide bSide:bSide cSide:cSide];
    return triangle;
}

- (float)area {
    float p = self.perimeter / 2;
    return sqrtf(p * (p - _aSide) * (p - _bSide) * (p - _cSide));
    
}

-(float)perimeter{
    return _aSide + _bSide + _cSide;
}

@end
