//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"
#import "Pizza.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings
{
//  BOOL kitchenShouldUpgradeOrder = [self.kitchenDelegate kitchenShouldUpgradeOrder:self];
//  BOOL kitchenShouldMakePizza = [self.kitchenDelegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings];
  
  Pizza *pizza = [[Pizza alloc] initWithSizeAndToppings:size topping:toppings];
  
//  [self.kitchenDelegate kitchenDidMakePizza:pizza];
  
  return pizza;
}

//- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
//  <#code#>
//}
//
//- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
//  <#code#>
//}

@end
