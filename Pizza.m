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

+ (PizzaSize) sizeConvertToEnum : (NSString *) sizeString{
  if ([sizeString isEqualToString: @"small"]) {
    return small;
  } else if ([sizeString isEqualToString: @"medium"]) {
    return medium;
  } else if ([sizeString isEqualToString: @"large"]) {
    return large;
  } else {
    return small;
  }
}

+ (NSString *) enumConvertToSize : (PizzaSize)size {
  if (size == small) {
    return @"small";
  } else if (size == medium) {
    return @"medium";
  } else if (size == large) {
    return @"large";
  } else {
    return @"small";
  }
}

+ (NSArray *) toppings : (NSArray *) toppingsArray{
  NSMutableArray *toppingsMutableArray = [[NSMutableArray alloc] init];
  [toppingsMutableArray addObjectsFromArray:toppingsArray];
  [toppingsMutableArray removeObjectAtIndex:0];
  return toppingsMutableArray;
}
@end
