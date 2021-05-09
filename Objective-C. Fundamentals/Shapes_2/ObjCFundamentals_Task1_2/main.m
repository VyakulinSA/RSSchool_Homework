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
        NSLog(@"Description Circle:\nArea: %.2f\nPerimeter: %.2f", circle.area,circle.perimeter);
        
        Rectangle *rectangle = [[Rectangle alloc] initWithSides_width:2.4335 height:5.432];
        NSLog(@"Description Rectangle:\nArea: %.2f\nPerimeter: %.2f", rectangle.area,rectangle.perimeter);
        
        Triangle *triangle = [Triangle createTriangleWithSides_aSide:3 bSide:4 cSide:5];
        NSLog(@"Description Triangle:\nArea: %.2f\nPerimeter: %.2f", triangle.area,triangle.perimeter);

    }
    return 0;
}
