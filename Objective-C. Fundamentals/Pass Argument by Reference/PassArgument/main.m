//
//  main.m
//  PassArgument
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import <Foundation/Foundation.h>
#import "someClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSError *error = nil; //создаем пустой объект ошибки
        someClass *class = [someClass new];
        
        BOOL flagFunction = [class someUsefulFunction:-5 error:&error]; //передаем пустую ошибку, если все хорошо, она такая и вернется, если нет то сгенерится ошибка, и у ошибки изменится описание
        
        if (!flagFunction){
            //если вернулось не true, то читаем ошибку
            NSLog(@"\nError: %@", [error localizedDescription]);
            return 1;
        }
        NSLog(@"\nComplete");
    }
    return 0;
}
