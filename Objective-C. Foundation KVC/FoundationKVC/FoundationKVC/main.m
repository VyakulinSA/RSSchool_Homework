//
//  main.m
//  FoundationKVC
//
//  Created by Вякулин Сергей on 12.05.2021.
//

#import <Foundation/Foundation.h>

NSString* removeDuplicateSpaces(NSString *string);
NSString* removeRepeatedChar(NSString *string);
NSString* longestWord(NSString* string);
NSInteger vowels(NSString *string);
void writingStringInFile(void);
void getCurrentDate(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray <NSString *> *strings = @[@"      ", @"one  two    three",@"    one   two  "];
        for (NSString *string in strings) {
            NSLog(@"\nNew string1: |%@|",removeDuplicateSpaces(string));
        }

        NSArray <NSString *> *strings2 = @[@"      ", @"aaaa bbbbbcvvvv",@"aa bbaaa  v"];
        for (NSString *string in strings2) {
            NSLog(@"\nNew string2: |%@|",removeRepeatedChar(string));
        }

        NSArray <NSString *> *strings3 = @[@"", @" ", @"one two three"];
        for (NSString *string in strings3) {
            NSLog(@"\nNew string3 longestWord: |%@|",longestWord(string));
        }

        NSArray <NSString *> *strings4 = @[@"a A", @"three", @"a  E  u  I  y o"];
        for (NSString *string in strings4) {
            NSLog(@"\nNew string4 vowels count: |%ld|",(long)vowels(string));
        }
        
        writingStringInFile();
        getCurrentDate();
        
        
        
        
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
    NSString *pattern = @"(\\w|\\s)\\1*+"; //паттерн на совпадение 1 или больше пробелов табцляци и тд (\s+)
    NSRegularExpressionOptions regOpt = NSRegularExpressionCaseInsensitive; //создаем с опциями в любом регистре
    //создаем само регулярное выражение на основе паттерна
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:regOpt error:nil];
    //получаем массив с совпадениями
    NSArray *matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    NSMutableString *mutString = [NSMutableString new];
    //пробегаемся по всем совпадениям и берем информацию о позиции и длинне вхождения паттерна
    for (NSTextCheckingResult *result in matches) {
        NSRange firstHalfRange = [result rangeAtIndex:1];
        NSString *sds = [string substringWithRange:NSMakeRange(firstHalfRange.location, 1)];
        [mutString appendString:sds];
    }
    return mutString;
}

NSString* longestWord(NSString* string){
    NSMutableString *mutStr = [NSMutableString stringWithString:string];
    NSMutableArray <NSString *> *mutArr = [mutStr componentsSeparatedByString:@" "];
    
    if ( [mutArr count] > 1){
        [mutArr sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
            if ([obj1 length] > [obj2 length]){
                return NSOrderedAscending;
            } else {
                return NSOrderedDescending;
            }
        }];
        return [mutArr[0] length] > 0 ? mutArr[0] : nil;
    } else if ([mutArr count] == 1){
        return [mutArr[0] length] > 0 ? mutArr[0] : nil;
    }else {
        return nil;
    }
}

NSInteger vowels(NSString *string){
    NSString *pattern = @"[aeiou]";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                options:NSRegularExpressionCaseInsensitive
                                                error:nil];
    return [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, [string length])];
}

//        MARK: writingStringInFile
void writingStringInFile(void){
    NSLog(@"%@",NSFileManager.defaultManager.currentDirectoryPath);
    //создаем путь к каталогу - это либо строка с путем, куда нам надо, либо используем объеуты типа NSTemporaryDirectory() или папка документы(см документацию как создавать)
    NSString *catalogPath = NSFileManager.defaultManager.currentDirectoryPath;
    //создаем абсолютный путь к файлу используя путь к каталогу + название файла
    NSString *filePAth = [NSString stringWithFormat:@"%@/textfile.txt",catalogPath];
    NSString *textToFile = @"Hello world in file";
    
    //записываем текст в  файл. если файла нет. то создается (при записи перезаписывает то что внутри, чтобы добавить текст. надо считать, добавить строку и записать снова
    NSLog(@"Write to file");
    [textToFile writeToFile:filePAth atomically:YES encoding:NSUTF8StringEncoding error:nil];
    //получаем текст из файла
    NSLog(@"Read from file");
    NSString *textFromFile = [[NSString alloc] initWithContentsOfFile:filePAth encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",textFromFile);
}

void getCurrentDate(void){
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSDate *currentDate = NSDate.now;
    [dateFormatter setDateFormat:@"yyyy-MMM-dd"];
    NSLog(@"%@", [dateFormatter stringFromDate:currentDate]);
}

