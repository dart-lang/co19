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
    description('Test parsing of the CSS shape-margin property.');
    
    // The test functions and globals used here are defined in parsing-test-utils.dart.
    
    // The test functions and globals used here are defined parsing-test-utils.js.
    
    validShapeLengths.forEach((value) {
        testShapeSpecifiedProperty("shape-margin", value, value);
    });
    
    testShapeSpecifiedProperty("shape-margin", "0", "0px");
    
    invalidShapeLengths.forEach((value) {
        testShapeSpecifiedProperty("shape-margin", value, "");
    });
    
    applyToEachArglist(
        testShapeComputedProperty,
        [// [property, value, expectedValue]
         ["shape-margin", "0", "0px"],
         ["shape-margin", "1px", "1px"],
         ["shape-margin", "-5em", "0px"],
         ["shape-margin", "identifier", "0px"],
         ["shape-margin", "\'string\'", "0px"],
         ["shape-margin", "calc(25%*3 - 10in)", "calc(-960px + 75%)"]]
    );
    
    applyToEachArglist(
        testNotInheritedShapeChildProperty,
        [// [property, parentValue, childValue, expectedChildValue]
         ["shape-margin", "0", "0", "0px"],
         ["shape-margin", "0", "1px", "1px"],
         ["shape-margin", "1px", "-1em", "0px"],
         ["shape-margin", "2px", "1px", "1px"]]
    );
    
    checkTestFailures();
}
