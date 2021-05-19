//
//  Incrementer.m
//  Blocks
//
//  Created by Вякулин Сергей on 19.05.2021.
//

#import "Incrementer.h"

@implementation Incrementer


- (IncrementerType)makeIncrementerForIncrementAmount:(NSInteger)amount {
    __block NSInteger inBlock = 0; //создаем локальную переменную, которую блок захватит и будет изменять (хранить инфо)
    
    IncrementerType incrementer = ^NSInteger (void){
        inBlock += amount; //делаем инкремент
        return inBlock;
    };
    
    incrementer = [incrementer copy]; //копируем в heap, чтобы блок не исчез вместе со стеком в котором запускался
    return incrementer; //возвращаем блок, который теперь находится на куче, и к которому мы имеем доступ в любом месте и моем передать значение.
}

@end
