//
//  NSString+custom.h
//  NSString category
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (custom)

- (BOOL)isEmpty;
- (NSString *)reversed;
- (NSUInteger)wordsCount;

@end

NS_ASSUME_NONNULL_END
