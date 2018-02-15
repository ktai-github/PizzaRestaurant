//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
          NSString *sizeString = [commandWords objectAtIndex:0];
          NSMutableArray *toppingsMutableArray = [[NSMutableArray alloc] init];
          [toppingsMutableArray arrayByAddingObjectsFromArray:commandWords];
          [toppingsMutableArray removeObjectAtIndex:0];
          
          PizzaSize sizeEnum = [Pizza sizeConvert:sizeString];
          
            // And then send some message to the kitchen...
          Pizza *pizza = [restaurantKitchen makePizzaWithSize:sizeEnum toppings:toppingsMutableArray];
        }

    }
    return 0;
}

