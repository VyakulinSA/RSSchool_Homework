//
//  CreateBlocksTypes.m
//  Blocks
//
//  Created by Вякулин Сергей on 18.05.2021.
//

#import "CreateBlocksTypes.h"

typedef NSString* (^StringBlockWithInt)(int);

@implementation CreateBlocksTypes

//Не захватываем контекст, поэтому блок глобальный
-(void)globalBlock{
    
    NSString* (^myGlobalBlockWith)(NSNumber*) = ^NSString* (NSNumber *num){
        return [[[NSString alloc] initWithFormat:@"%d", num.intValue] autorelease];
    };
    
    NSLog(@"Global block: %@", myGlobalBlockWith);
    
};

//захватываем переменную в стеке и используем -> блок стековый - уничтожется после завершения функции, и мы к нему уже не сможем обратиться
- (void)stackBlock {
    int num = 5;
    
    StringBlockWithInt myStackBlockWith = ^NSString* (int numberIn){
        numberIn = num;
        return [[[NSString alloc] initWithFormat:@"%d", numberIn] autorelease];
    };
    
    NSLog(@"Stack block: %@", myStackBlockWith);
    myStackBlockWith(num);
    NSLog(@"Stack block info: %@", myStackBlockWith);
    
}

//тот же стековый блок, но после захвата внутренней переменной мы при выходе создаем копию блока на куче, поэтому можем потом к нему обращаться.
- (void)mallocBlock {
  
    int num = 5;
    
    NSString* (^myMallocBlockWith)(void) = ^NSString* (void){
        return [[[NSString alloc] initWithFormat:@"%d", num] autorelease];
    };
    
    NSLog(@"Malloc block: %@", myMallocBlockWith);
    
    myMallocBlockWith = [myMallocBlockWith copy];
    
    NSLog(@"Malloc block: %@", myMallocBlockWith);
    
    [myMallocBlockWith release];
};

//создаем блок в свойстве класса, свойство должно быть обязательно copy, после отработки функции, можем работать с блоком из свойства класса не вызывая метод
- (void)propertyBlockFunc {
    
    int num = 5;
    
    self.propertyBlock = ^NSString* (int numberIn){
        int log = numberIn + num;
        return [[NSString alloc] initWithFormat:@"%d", log];
    };
    
    NSLog(@"Property block: %@", self.propertyBlock);
    
}

//при помощи директивы __block блок захватывает переменную в своем скоупе и может ее менять, потом при повторном вызове блока переменная изменяется в соответствии с указанным в блоке значением
- (void)changeVariableInBlock {
    
    __block int num = 5;
    
    self.propertyBlock = ^NSString* (int numberIn){
        num += numberIn;
        NSLog(@"StackVariable In block: %d", num);
        return [[NSString alloc] initWithFormat:@"%d", num];
    };
    NSLog(@"VariableInBlock block: %d", num);
    
}

static int staticNumber = 10;

- (void)changeStaticVariableInBlock {
    
    __weak wewakSelf = self;

    self.propertyBlock = ^NSString* (int numberIn){
        
        __strong strongSelf = wewakSelf;
        
        staticNumber += numberIn;
        NSLog(@"StaticNumberInClass In block: %d", staticNumber);
        return [[NSString alloc] initWithFormat:@"%d", staticNumber];
    };
    NSLog(@"StaticNumber in method: %d", staticNumber);
    
}





@end
