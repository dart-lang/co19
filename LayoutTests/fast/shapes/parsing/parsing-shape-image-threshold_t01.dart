/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../../testharness.dart";
import "parsing-test-utils.dart";

void main() {
    description('Test parsing of the CSS shape-image-threshold property.');
    
    // The test functions and globals used here are defined in parsing-test-utils.dart.
    
    applyToEachArglist(
        testShapeComputedProperty,
        [// [property, value, expectedValue]
         ["shape-image-threshold", "0", "0"],
         ["shape-image-threshold", "0.5", "0.5"],
         ["shape-image-threshold", "1", "1"],
         ["shape-image-threshold", "-0.1", "0"],
         ["shape-image-threshold", "1.1", "1"],
         ["shape-image-threshold", "identifier", "0"],
         ["shape-image-threshold", "\'string\'", "0"]
    ]
    
    
    );
    
    applyToEachArglist(
        testNotInheritedShapeChildProperty,
        [// [property, parentValue, childValue, expectedChildValue]
         ["shape-image-threshold", "0", "0", "0"],
         ["shape-image-threshold", "0", "1", "1"],
         ["shape-image-threshold", "1", "-1", "0"],
         ["shape-image-threshold", "2", "1", "1"]]
    );
    
    checkTestFailures();
}

