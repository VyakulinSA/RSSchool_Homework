//
//  someClass.h
//  PassArgument
//
//  Created by Вякулин Сергей on 03.05.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface someClass : NSObject

- (BOOL)someUsefulFunction:(NSInteger)number error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
