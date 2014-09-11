/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test parsing of the CSS wrap-through property.
 */
import "dart:html";
import "../../../testcommon.dart";
import "parsing-test-utils.dart";

main() {
  // The test functions and globals used here are defined parsing-test-utils.js.

  applyToEachArglist(
      testExclusionSpecifiedProperty,
      [// [property, value, expectedValue]
      ["-webkit-wrap-through", "wrap", "wrap"],
      ["-webkit-wrap-through", "none", "none"],
      ["-webkit-wrap-through", ";", ""],
      ["-webkit-wrap-through", "5", ""],
      ["-webkit-wrap-through", "-1.2", ""],
      ["-webkit-wrap-through", "\'string\'", ""]]
      );

  applyToEachArglist(
      testExclusionComputedProperty,
      [// [property, value, expectedValue]
      ["-webkit-wrap-through", "wrap", "wrap"],
      ["-webkit-wrap-through", "5", "wrap"],
      ["-webkit-wrap-through", "\'string\'", "wrap"]]
      );

  applyToEachArglist(
      testNotInheritedExclusionChildProperty,
      [// [property, parentValue, childValue, expectedChildValue]
      ["-webkit-wrap-through", "wrap", "none", "none"],
      ["-webkit-wrap-through", "none", "wrap", "wrap"]]
      );
}
