//
//  Rectangle.h
//  ObjCFundamentals_Task1
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import "Shape.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : Shape

@property (nonatomic) float width;
@property (nonatomic) float height;

- (instancetype)initWithSides_width:(float)width height:(float)height;
+ (Rectangle *)createRectangle;

@end

NS_ASSUME_NONNULL_END
