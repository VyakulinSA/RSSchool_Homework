//
//  someClass.m
//  PassArgument
//
//  Created by Вякулин Сергей on 03.05.2021.
//

#import "someClass.h"

@implementation someClass

- (BOOL)someUsefulFunction:(NSInteger)number error:(NSError **)error {
    if (number < 0) {
        //создаем ошибку
        NSError *errorUnderZero = [NSError errorWithDomain:@"underZero" code:-1 userInfo:@{NSLocalizedDescriptionKey : NSLocalizedString(@"Число меньше нуля", nil)}];
        //меняем указатель на другой(только что сгенерили)
        *error = errorUnderZero;
        return 0;
    } else if (number > 10) {
        NSError *errorUnderZero = [NSError errorWithDomain:@"underZero" code:-1 userInfo:@{NSLocalizedDescriptionKey : NSLocalizedString(@"Число больше 10", nil)}];
        *error = errorUnderZero;
        return 0;
    }
    return 1;
}

@end
