//
//  BZStackView.h
//  BZStackView
//
//  Created by Joseph DeCarlo on 9/3/11.
//  Copyright 2011 Baked Ziti. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BZStackViewDelegate;

@interface BZStackView : UIView {
    
}

@property (nonatomic, assign) IBOutlet id<BZStackViewDelegate> delegate;
@property (nonatomic, assign) CGSize contentSize;

@end

@protocol BZStackViewDelegate <NSObject>

@optional
- (void) stackViewWillLayoutSubViews:(BZStackView*)stackView;
- (void) stackView:(BZStackView*)stackView contentSizeDidChange:(CGSize)contentSize;

@end
