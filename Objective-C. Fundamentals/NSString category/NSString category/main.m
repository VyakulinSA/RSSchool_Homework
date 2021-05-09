//
//  main.m
//  NSString category
//
//  Created by Вякулин Сергей on 02.05.2021.
//

#import <Foundation/Foundation.h>
#import "NSString+custom.m"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *testString = @"qw re tr\nre tr \nss tr";
        BOOL flag = [testString isEmpty];
        NSLog(@"%hhd", flag);
        NSLog(@"%@", [testString reversed]);
        NSLog(@"%lu", (unsigned long)[testString wordsCount]);
    }
    return 0;
}
