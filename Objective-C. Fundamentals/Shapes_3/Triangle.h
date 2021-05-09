//
//  Triangle.h
//  ObjCFundamentals_Task1
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import "Shape.h"

NS_ASSUME_NONNULL_BEGIN

@interface Triangle : Shape

@property (nonatomic) float aSide;
@property (nonatomic) float bSide;
@property (nonatomic) float cSide;

- (instancetype)initWithSides_aSide:(float)aSide bSide:(float)bSide cSide:(float)cSide;
+ (Triangle *)createTriangleWithSides_aSide:(float)aSide bSide:(float)bSide cSide:(float)cSide;


@end

NS_ASSUME_NONNULL_END
