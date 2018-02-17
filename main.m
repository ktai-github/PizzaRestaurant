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
#import "ManagerNoAnchoviesNoUpgrade.h"
#import "ManagerUpgradeNice.h"
#import "NoManager.h"

//static NSString * userInputSizeAndToppings() {
//
//}

static void separateSizeAndToppingsFromInput(NSString *inputString, PizzaSize *sizeEnum, NSArray **toppingsArray) {
  NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
  NSString *sizeString = @"";
  
  if ([commandWords objectAtIndex:0]) {
    sizeString = [commandWords objectAtIndex:0];
  }
  
  *toppingsArray = [Pizza toppings:commandWords];
  *sizeEnum = [Pizza sizeConvertToEnum:sizeString];
}

static NSString * userInputIfManagerNice() {
  NSLog(@"Is the manager nice? Enter 'yes', 'no', or 'none'\n (workers are lazy, only one pizza one time can be made when 'none' is entered for manager)>");
  char mgr[5];
  fgets (mgr, 5, stdin);
  
  NSString *niceManager = [[NSString alloc] initWithUTF8String:mgr];
  return niceManager;
}

static void determineMakePizzaAndUpgrade(ManagerNoAnchoviesNoUpgrade *managerNoAnchNoUp, ManagerUpgradeNice *managerUpNice, NSString *niceManager, NoManager *noManager, Kitchen *restaurantKitchen) {
  
  if ([niceManager isEqualToString:@"yes\n"]) {
    restaurantKitchen.kitchenDelegate = managerUpNice;
  
  } else if ([niceManager isEqualToString:@"no\n"]) {
    restaurantKitchen.kitchenDelegate = managerNoAnchNoUp;
  
  } else {
    restaurantKitchen.kitchenDelegate = noManager;
  }
}

static void processPizzaOrder(Kitchen *restaurantKitchen, BOOL shouldMakePizza, BOOL shouldUpgrade, PizzaSize *sizeEnum, NSArray *toppingsArray) {
  
  if (shouldMakePizza == 1) {
    
    if (shouldUpgrade == 1) {
      *sizeEnum = large;
    }
    
    // And then send some message to the kitchen...
    Pizza *pizza = [restaurantKitchen makePizzaWithSize:*sizeEnum toppings:toppingsArray];
    
    if ([restaurantKitchen.kitchenDelegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
      [restaurantKitchen.kitchenDelegate kitchenDidMakePizza:pizza];
    }
    
    NSString *readyPizzaSize = [Pizza enumConvertToSize:pizza.size];
    NSString *readyToppings = [toppingsArray componentsJoinedByString:@" "];
    NSLog(@"%@ %@ pizza is ready!", readyPizzaSize, readyToppings);
    
  } else {
    
    NSLog(@"pizza not made");
    
  }
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
      
      Kitchen *restaurantKitchen = [Kitchen new];

      ManagerUpgradeNice *managerUpNice = [[ManagerUpgradeNice alloc] init];
      ManagerNoAnchoviesNoUpgrade *managerNoAnchNoUp = [[ManagerNoAnchoviesNoUpgrade alloc] init];
      NoManager *noManager = [[NoManager alloc] init];
      

      while (TRUE) {
        // Loop forever
        NSLog(@"Please pick your pizza size and toppings:");
        NSLog(@"> ");
        char str[100];
        fgets (str, 100, stdin);
        
        NSString * inputString = [[NSString alloc] initWithUTF8String:str];
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSLog(@"Input was %@", inputString);
        
        NSArray * toppingsArray;
        PizzaSize sizeEnum;
        separateSizeAndToppingsFromInput(inputString, &sizeEnum, &toppingsArray);
        
        NSString * niceManager = userInputIfManagerNice();
        
        determineMakePizzaAndUpgrade(managerNoAnchNoUp, managerUpNice, niceManager, noManager, restaurantKitchen);
        
        BOOL shouldMakePizza = [restaurantKitchen.kitchenDelegate kitchen:restaurantKitchen shouldMakePizzaOfSize:sizeEnum andToppings:toppingsArray];
        BOOL shouldUpgrade = [restaurantKitchen.kitchenDelegate kitchenShouldUpgradeOrder:restaurantKitchen];
        
        processPizzaOrder(restaurantKitchen, shouldMakePizza, shouldUpgrade, &sizeEnum, toppingsArray);
        
//        if (restaurantKitchen.kitchenDelegate == noManager) {
//          break;
//        }
      }
      
    }
    return 0;
}

