//
//  NSString+custom.m
//  NSString category
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import "NSString+custom.h"

@implementation NSString (custom)

- (BOOL)isEmpty{
    if (self.length > 0) {
        return YES;
    }
    return NO;
}

- (NSString *)reversed {
    NSMutableString *endString = [NSMutableString new];
    
    while ([self length]!=[endString length]) {
        NSRange range = NSMakeRange([self length]-[endString length]-1, 1);
        [endString appendString:[self substringWithRange:range]];
    }
    return endString;
    
}

- (NSUInteger)wordsCount {
    NSUInteger wordsCounter = 0;
    NSArray *arrayOfComponents = [self componentsSeparatedByString:@"\n"];
    
    for (NSString *object in arrayOfComponents) {
        NSArray *arrayOfComponentsInObject = [object componentsSeparatedByString:@" "];
        for (NSString *item in arrayOfComponentsInObject) {
            if (![item  isEqual: @""]) {
                wordsCounter ++;
            }
        }
    }
    return wordsCounter;
}

@end
