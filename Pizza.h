//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by KevinT on 2018-02-15.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {small, medium, large} PizzaSize;

@interface Pizza : NSObject

- (PizzaSize) size;

+ (NSArray *) toppings : (NSArray *) toppingsArray;

+ (PizzaSize) sizeConvertToEnum : (NSString *) sizeString;

+ (NSString *) enumConvertToSize : (PizzaSize) size;

- (instancetype)initWithSizeAndToppings : (PizzaSize) size topping : (NSArray *) toppingArray;

@end
