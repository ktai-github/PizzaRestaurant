//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by KevinT on 2018-02-15.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {small = 1, medium = 2, large = 3} PizzaSize;

@interface Pizza : NSObject

- (PizzaSize) size;

- (NSArray *) toppings;

+ (PizzaSize) sizeConvert : (NSString *) sizeString;

- (instancetype)initWithSizeAndToppings : (PizzaSize) size topping : (NSArray *) toppingArray;

@end
