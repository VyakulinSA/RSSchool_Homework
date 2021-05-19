//
//  main.m
//  FoundationKVC
//
//  Created by Вякулин Сергей on 12.05.2021.
//

#import <Foundation/Foundation.h>

NSString* removeDuplicateSpaces(NSString *string);
NSString* removeRepeatedChar(NSString *string);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray <NSString *> *strings = @[@"      ", @"one  two    three",@"    one   two  "];
        for (NSString *string in strings) {
            NSLog(@"\nNew string1: |%@|",removeDuplicateSpaces(string));
        }
        
        NSArray <NSString *> *strings2 = @[@"      ", @"aaaa   bbbbbvvvv",@"aabbaaavvv"];
        for (NSString *string in strings2) {
            NSLog(@"\nNew string2: |%@|",removeRepeatedChar(string));
        }
        
    }
    return 0;
}

NSString* removeDuplicateSpaces(NSString *string){
    NSString *pattern = @"\\s+"; //паттерн на совпадение 1 или больше пробелов табцляци и тд (\s+)
    NSRegularExpressionOptions regOpt = NSRegularExpressionCaseInsensitive; //создаем с опциями в любом регистре
    //создаем само регулярное выражение на основе паттерна
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:regOpt error:nil];
    //получаем строку в которой все совпадения паттерна заменяются на указанное значение (в моем случае любые повторяющиеся пробелы табуляции и тд, заменяются одним пробелом)
    NSString *modString = [regex stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@" "];
    return modString;
}

NSString* removeRepeatedChar(NSString *string){
    NSString *pattern = @"(\\w|\\s)\\1+"; //паттерн на совпадение 1 или больше пробелов табцляци и тд (\s+)
    NSRegularExpressionOptions regOpt = NSRegularExpressionCaseInsensitive; //создаем с опциями в любом регистре
    //создаем само регулярное выражение на основе паттерна
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:regOpt error:nil];
    //получаем массив с совпадениями
    NSArray *matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    NSMutableString *mutString = [NSMutableString new];
    //пробегаемся по всем совпадениям и берем информацию о позиции и длинне вхождения паттерна
    for (NSTextCheckingResult *result in matches) {
        NSRange firstHalfRange = [result rangeAtIndex:1];
        NSString *sds = [string substringWithRange:NSMakeRange(firstHalfRange.location + 1, 1)];
        [mutString appendString:sds];
    }
    return mutString;
}
