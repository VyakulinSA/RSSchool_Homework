//
//  main.m
//  ObjCFundamentals_Task1
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import <Foundation/Foundation.h>
#import "Circle.h"
#import "Rectangle.h"
#import "Triangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Circle *circle = [Circle createCircle];
        circle.radius = 4;
        NSLog(@"Description: %@", [circle description]);
        
        Rectangle *rectangle = [[Rectangle alloc] initWithSides_width:2.4335 height:5.432];
        NSLog(@"Description: %@", [rectangle description]);
        
        Triangle *triangle = [Triangle createTriangleWithSides_aSide:3 bSide:4 cSide:5];
        NSLog(@"Description: %@", [triangle description]);
        

    
    }
    return 0;
}
