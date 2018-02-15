//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by KevinT on 2018-02-15.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@interface Pizza()

@property (nonatomic) PizzaSize size;
@property (nonatomic) NSArray *toppings;

@end

@implementation Pizza

- (instancetype)init
{
  self = [super init];
  if (self) {
    NSArray *defaultPizzaToppings = [[NSArray alloc] initWithObjects:@"cheese",nil];
    return [self initWithSizeAndToppings:1 topping:defaultPizzaToppings];
  }
  return self;
}

- (instancetype)initWithSizeAndToppings : (PizzaSize)size topping : (NSArray *) toppingArray
{
  self = [super init];
  if (self) {
    self.size = size;
    self.toppings = toppingArray;
  }
  return self;
}

+ (PizzaSize) sizeConvert : (NSString *) sizeString{
  if ([sizeString isEqualToString: @"small"]) {
    return 1;
  } else if ([sizeString isEqualToString: @"medium"]) {
    return 2;
  } else if ([sizeString isEqualToString: @"large"]) {
    return 3;
  } else {
    return 1;
  }
}

- (NSArray *) toppings{
  NSArray *toppings = [[NSArray alloc] init];
  return toppings;
}
@end
