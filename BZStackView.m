//
//  BZStackView.m
//  BZStackView
//
//  Created by Joseph DeCarlo on 9/3/11.
//  Copyright 2011 Baked Ziti. All rights reserved.
//

#import "BZStackView.h"
#import "UIView+BZStackViewBehaviors.h"

@interface BZStackView()

- (CGRect) adjustedRectForSubView:(UIView*)subView withPreviousSubView:(UIView*)prevView;

@end

@implementation BZStackView

@synthesize delegate;
@synthesize contentSize;

//--------------------------------------------------------------------------------------------------------------
#pragma mark - Initialization and Deallocation


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)dealloc {
    
    self.delegate = nil;
    
    [super dealloc];
}

//--------------------------------------------------------------------------------------------------------------
#pragma mark - UIView

- (void) layoutSubviews {
    
    [super layoutSubviews];
    
    int contentHeight = 0;
    
    if ([self.delegate respondsToSelector:@selector(stackViewWillLayoutSubViews:)]) {
        
        [self.delegate stackViewWillLayoutSubViews:self];
    }
    
    for (int i = 0; i < [self.subviews count]; ++i) {

        UIView *subView = [self.subviews objectAtIndex:i];
        
        //Ignore things that are meant to be invisible
        if (subView.hidden == YES || subView.alpha == 0.0) {
            continue;
        }
        
        contentHeight += subView.frame.size.height + [subView.paddingTop floatValue] + [subView.paddingBottom floatValue];
        
        //if this is the first subView, there is no previous
        //so only use the subView
        if (i == 0) {
            subView.frame = [self adjustedRectForSubView:subView withPreviousSubView:nil];
            continue;
        }
        
        UIView *prevView = [self.subviews objectAtIndex:i -1];
    
        subView.frame = [self adjustedRectForSubView:subView withPreviousSubView:prevView];
        
//        NSLog(@"%@'s height:%f", [subView class], subView.frame.size.height);

        //If this is the last one, then set the contentSize
        if (i == [self.subviews count] - 1) {

            self.contentSize = CGSizeMake(self.frame.size.width, contentHeight);
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.contentSize.height);
            
            if ([self.delegate respondsToSelector:@selector(stackView:contentSizeDidChange:)]) {
                
                [self.delegate stackView:self contentSizeDidChange:self.contentSize];
            }
        }

    }
}

//--------------------------------------------------------------------------------------------------------------
#pragma mark - Utility Methods

- (CGRect) adjustedRectForSubView:(UIView *)subView withPreviousSubView:(UIView *)prevView {
    
    CGFloat prevY = 0.0;
    CGFloat prevHeight = 0.0;
    CGFloat subPaddingTop = 0.0;
    CGFloat prevPaddingBottom = 0.0;
    
    if (prevView) {

        prevY = prevView.frame.origin.y;
        prevHeight = prevView.frame.size.height;
        subPaddingTop = [subView.paddingTop floatValue];
        prevPaddingBottom = [prevView.paddingBottom floatValue];
    }
    
    CGFloat topPadding = subPaddingTop + [self.paddingTop floatValue];
    CGFloat bottomPadding = prevPaddingBottom + [self.paddingBottom floatValue];
    
    CGFloat y = prevY + prevHeight + topPadding + bottomPadding;
    
    return CGRectMake(subView.frame.origin.x, y, subView.frame.size.width, subView.frame.size.height);
}

@end
