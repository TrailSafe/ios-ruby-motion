//
//  PXStyleable.h
//  PXEngine
//
//  Created by Kevin Lindsey on 7/11/12.
//  Copyright (c) 2012 Pixate, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PXRuleSet;

/**
 *  The PXStyleable protocol defines a set of properties and methods needed in order to style a given object.
 */
@protocol PXStyleable <NSObject>

@required

/**
 *  The ID for this styleable object. Ideally, this value should be unique within the context being styled.
 */
@property (nonatomic, copy) NSString *styleId;

/**
 *  The CSS classes associated with this styleable object. One or more classes may be specified by delimiting each with
 *  whitespace
 */
@property (nonatomic, copy) NSString *styleClass;

/**
 *  The element name to use when matching this styleable object against a selector
 */
@property (readonly, nonatomic, copy) NSString *pxStyleElementName;

/**
 *  The style parent that contains this object
 */
@property (readonly, nonatomic, weak) id pxStyleParent;

/**
 *  The style children owned by this object
 */
@property (readonly, nonatomic, copy) NSArray *pxStyleChildren;

/**
 *  The bounds of the item being styled
 */
@property (nonatomic) CGRect bounds;

/**
 *  The frame of the item being styled
 */
@property (nonatomic) CGRect frame;

@optional

/**
 *  Returns reset styles list for this styleable
 */
- (NSArray *)resetStyles;

/**
 *  Update styles for this styleable and all of its descendant styleables
 */
- (void)updateStyles;

/**
 *  Update styles for this styleable only
 */
- (void)updateStylesNonRecursively;

/**
 *  Update styles for this styleable and all of its descendant styleables asynchronously
 */
- (void)updateStylesAsync;

/**
 *  Update styles for this styleable only asynchronously
 */
- (void)updateStylesNonRecursivelyAsync;

/**
 *  Return the namespace URI associated with this object
 */
@property (readonly, nonatomic, copy) NSString *pxStyleNamespace;

/**
 *  Inline styles to apply to this object
 */
@property (nonatomic, copy) NSString *styleCSS;

/**
 *  Return a list of pseudo-classes that are recognized by this object
 */
@property (readonly, nonatomic, copy) NSArray *supportedPseudoClasses;

/**
 *  Return the default pseudo-class associated with this object when none is specified in a selector
 */
@property (readonly, nonatomic, copy) NSString *defaultPseudoClass;

/**
 *  Return a list of pseudo-elements that are recognized by this object
 */
@property (readonly, nonatomic, copy) NSArray *supportedPseudoElements;

/**
 *  Register any NSNotificationCenter notifications needed by this object
 */
- (void)registerNotifications;

/**
 *  Return a string value for the specified attribute name. If the name does not exist, a nil value should be returned
 *
 *  @param name The name of the attribute
 *  @param aNamespace The namespace of the attribute. This may be nil
 */
- (NSString *)attributeValueForName:(NSString *)name withNamespace:(NSString *)aNamespace;

/**
 *  Return the styleable associated with the given pseudo-element
 *
 *  @param pseudoElement The pseudo-element name
 */
- (id<PXStyleable>)styleableForPseudoElement:(NSString *)pseudoElement;

/**
 *  Return a dictionary for animatable properties
 */
- (NSDictionary *)animationPropertyHandlers;

@end
