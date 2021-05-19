//
//  CreateBlocksTypes.h
//  Blocks
//
//  Created by Вякулин Сергей on 18.05.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CreateBlocksTypes : NSObject

@property(nonatomic, copy) NSString* (^propertyBlock)(int);

- (void)globalBlock;
- (void)stackBlock;
- (void)mallocBlock;
- (void)propertyBlockFunc;
- (void)changeVariableInBlock;
- (void)changeStaticVariableInBlock;




@end

NS_ASSUME_NONNULL_END
