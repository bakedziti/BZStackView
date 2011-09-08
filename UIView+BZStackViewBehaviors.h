//
//  UIView+BZStackViewViewBehaviors.h
//  BZStackView
//
//  Created by Joseph DeCarlo on 9/3/11.
//  Copyright 2011 Baked Ziti. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView (BZStackViewBehaviors)

@property (nonatomic, retain) NSNumber *paddingLeft;
@property (nonatomic, retain) NSNumber *paddingRight;
@property (nonatomic, retain) NSNumber *paddingTop;
@property (nonatomic, retain) NSNumber *paddingBottom; 

@property (nonatomic, retain) NSObject *objectTag;

@end
