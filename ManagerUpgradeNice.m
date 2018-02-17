//
//  ManagerUpgradeNice.m
//  PizzaRestaurant
//
//  Created by KevinT on 2018-02-16.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "ManagerUpgradeNice.h"

@implementation ManagerUpgradeNice
- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings { 
  return TRUE;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen { 
  return TRUE;
}

- (void) kitchenDidMakePizza : (Pizza *) pizza {
  NSLog(@"enjoy!");
}

@end
