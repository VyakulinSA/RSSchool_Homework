//
//  Incrementer.h
//  Blocks
//
//  Created by Вякулин Сергей on 19.05.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef  NSInteger (^IncrementerType)(void);

@interface Incrementer : NSObject

-(IncrementerType)makeIncrementerForIncrementAmount:(NSInteger)amount;

@end

NS_ASSUME_NONNULL_END
