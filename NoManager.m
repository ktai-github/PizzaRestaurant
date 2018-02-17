//
//  NoManager.m
//  PizzaRestaurant
//
//  Created by KevinT on 2018-02-16.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "NoManager.h"

@implementation NoManager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
  return TRUE;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
  return FALSE;
}

@end
