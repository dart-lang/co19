/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class RangeError
 * Error thrown due to an index being outside a valid range.
 * @description Checks that RangeError-specific methods work as specified.
 * @author sgrekhov@unipro.ru
 */
import "allTests.lib.dart" as rangeErrorTests;
import "inheritedTests.lib.dart" as inherited;

RangeError create(num invalidValue, int minValue, int maxValue) =>
  new RangeError.range(invalidValue, minValue, maxValue);

ArgumentError createArgError([value, String name, message]) {
  if (value is num && message is String) {
    return new RangeError.range(value, null, null, name, message);
  } else {
    return new ArgumentError.value(value, name, message);
  }
}

main() {
  rangeErrorTests.test(create);
  inherited.test(createArgError);
}
