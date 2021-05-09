//
//  main.m
//  NS_Enum
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, myEnum){
    North,
    East,
    South,
    West
};

NSString * getCardinalDirections(myEnum inputEnumValue);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\nCardinal directions: %@", getCardinalDirections(West));
    }
    return 0;
}

NSString * getCardinalDirections(myEnum inputEnumValue){
    switch (inputEnumValue) {
        case North:
            return @"north";
        case East:
            return @"east";
        case South:
            return @"south";
        case West:
            return @"west";
    }
}
