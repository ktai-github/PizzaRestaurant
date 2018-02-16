//
//  ManagerNoAnchoviesNoUpgrade.m
//  PizzaRestaurant
//
//  Created by KevinT on 2018-02-16.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "ManagerNoAnchoviesNoUpgrade.h"

@implementation ManagerNoAnchoviesNoUpgrade

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {

  for (NSString * topping in toppings) {
    if ([topping isEqualToString:@"anchovies"]) {
      NSLog(@"not making anchovies pizza");
      return FALSE;
    }
  }
  return TRUE;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
  return FALSE;
}

@end
