//
//  main.m
//  Blocks
//
//  Created by Вякулин Сергей on 18.05.2021.
//

#import <Foundation/Foundation.h>
#import "CreateBlocksTypes.h"
#import "Incrementer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CreateBlocksTypes *blockObj = [CreateBlocksTypes new];
        [blockObj globalBlock];
        [blockObj stackBlock];
        [blockObj mallocBlock];
        [blockObj propertyBlockFunc]; //после данного метода в свойство записывается блок, который можем дальше использовать
//        NSLog(@"without method block: %@", blockObj.propertyBlock(999)); //выдаст ошибку, если вышеуказанный метод не вызвать и не присвоить в проперти
        
//        NSString* (^newBlock)(int num) = ^NSString* (int num){
//            return @"newBlock";
//        };
//        [blockObj setPropertyBlock:newBlock];
        
        NSLog(@"MainProperty block: %@", blockObj.propertyBlock);
        NSLog(@"MainProperty block: %@", blockObj.propertyBlock(999)); //передаем блок, возвращается сумма увеличинная на 5
        
        [blockObj changeVariableInBlock];  
        NSLog(@"MainProperty block: %@", blockObj.propertyBlock(100));
        NSLog(@"MainProperty block: %@", blockObj.propertyBlock(100));
        
        [blockObj changeStaticVariableInBlock];
        NSLog(@"StaticProperty block: %@", blockObj.propertyBlock(100));
        
        Incrementer *incrementObj = [[Incrementer alloc] init];
        
        IncrementerType inc = [incrementObj makeIncrementerForIncrementAmount:3];
        IncrementerType inc1 = [incrementObj makeIncrementerForIncrementAmount:1];
        
        for (int i = 0; i < 10; i++) {
            NSLog(@"by 3: %ld", (long)inc());
            NSLog(@"by 1: %ld", (long)inc1());
            
        }
        
        
        
        
    }
    return 0;
}
