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
    description('Testing parsing of the shape-outside property.');
    
    // The test functions and globals used here are defined in parsing-test-utils.dart.
    
    validShapeValues.forEach((elt) {
        var value = (elt is List) ? elt[0] : elt;
        var expectedValue = (elt is List) ? elt[1] : elt;
        var computedValue = (elt is List && elt.length > 2) ? elt[2] : expectedValue;
        testShapeSpecifiedProperty("shape-outside", value, expectedValue);
        testShapeComputedProperty("shape-outside", value, computedValue);
    });
    
    testLocalURLShapeProperty("shape-outside", "url('image')", "url(image)");
    
    invalidShapeValues.forEach((value) {
        testShapePropertyParsingFailure("shape-outside", value, "none");
    });
    
    applyToEachArglist(
        testNotInheritedShapeProperty,
        [// [property, parentValue, childValue, expectedValue]
         ["-webkit-shape-outside", "none", "circle(30px at 10px 20px)", "parent: none, child: circle(30px at 10px 20px)"],
         ["-webkit-shape-outside", "circle(30px at 10px 20px)", "initial", "parent: circle(30px at 10px 20px), child: none"],
         ["-webkit-shape-outside", "circle(30px at 10px 20px)", "", "parent: circle(30px at 10px 20px), child: none"],
         ["-webkit-shape-outside", "circle(30px at 10px 20px)", "inherit", "parent: circle(30px at 10px 20px), child: circle(30px at 10px 20px)"],
         ["shape-outside", "", "inherit", "parent: none, child: none"],
         ["shape-outside", "none", "inherit", "parent: none, child: none"]]
    );
    
    checkTestFailures();
}
