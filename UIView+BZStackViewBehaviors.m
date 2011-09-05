//
//  UIView+BZStackViewViewBehaviors.m
//  BZStackView
//
//  Created by Joseph DeCarlo on 9/3/11.
//  Copyright 2011 Baked Ziti. All rights reserved.
//

#import "UIView+BZStackViewBehaviors.h"
#import <objc/runtime.h>



@implementation UIView (BZStackViewBehaviors)

static char paddingLeftKey;
static char paddingRightKey;
static char paddingTopKey;
static char paddingBottomKey;

//--------------------------------------------------------------------------------------------------------------
#pragma mark - Properties

- (NSNumber*) paddingTop {
    
    NSNumber *top = objc_getAssociatedObject(self, &paddingTopKey);
    
    if (!top) {
        
        top = [NSNumber numberWithFloat:0.0];
        
        [self setPaddingTop:top];
    }
    
    return top;
}

- (void) setPaddingTop:(NSNumber *)paddingTop {
    
    objc_setAssociatedObject(self, &paddingTopKey, paddingTop, OBJC_ASSOCIATION_RETAIN);
}

- (NSNumber*) paddingBottom {

    NSNumber *bottom = objc_getAssociatedObject(self, &paddingBottomKey);
    
    if (!bottom) {
        
        bottom = [NSNumber numberWithFloat:0.0];
        
        [self setPaddingBottom:bottom];
    }
    
    return bottom;
}

- (void) setPaddingBottom:(NSNumber *)paddingBottom {
    
    objc_setAssociatedObject(self, &paddingBottomKey, paddingBottom, OBJC_ASSOCIATION_RETAIN);
}

- (NSNumber*) paddingLeft {
    
    NSNumber *left = objc_getAssociatedObject(self, &paddingLeftKey);
    
    if (!left) {
        
        left = [NSNumber numberWithFloat:0.0];
        
        [self setPaddingLeft:left];
    }
    
    return left;
}

- (void) setPaddingLeft:(NSNumber *)paddingLeft {
    
    objc_setAssociatedObject(self, &paddingLeftKey, paddingLeft, OBJC_ASSOCIATION_RETAIN);
}

- (NSNumber*) paddingRight {
    
    NSNumber *right = objc_getAssociatedObject(self, &paddingRightKey);
    
    if (!right) {
        
        right = [NSNumber numberWithFloat:0.0];
        
        [self setPaddingRight:right];
    }
    
    return right;
}

- (void) setPaddingRight:(NSNumber *)paddingRight {
    
    objc_setAssociatedObject(self, &paddingRightKey, paddingRight, OBJC_ASSOCIATION_RETAIN);
}

@end
