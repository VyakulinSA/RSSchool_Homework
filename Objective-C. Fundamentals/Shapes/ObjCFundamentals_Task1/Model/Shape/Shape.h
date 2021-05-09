//
//  Shape.h
//  ObjCFundamentals_Task1
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Shape : NSObject

- (float)area;
- (float)perimeter;
- (NSString *)description;

@end

NS_ASSUME_NONNULL_END
