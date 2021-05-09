//
//  Circle.h
//  ObjCFundamentals_Task1
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import "Shape.h"

NS_ASSUME_NONNULL_BEGIN

@interface Circle : Shape {
    float pi;
}

@property (nonatomic) float radius;

- (instancetype)initWithRadius:(float)radius;
+ (Circle *)createCircle;

@end

NS_ASSUME_NONNULL_END
