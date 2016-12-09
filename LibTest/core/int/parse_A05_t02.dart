  /*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int parse(String source, {int radix, int onError(String source)})
 * Parse source as a, possibly signed, integer literal and return its value.
 * ...
 * If the source is not a valid integer literal, optionally prefixed by a sign,
 * the onError is called with the source as argument, and its return value is
 * used instead. If no onError is provided, a FormatException is thrown.
 *
 * The onError handler can be chosen to return null. This is preferable to to
 * throwing and then immediately catching the FormatException. Example:
 *
 * var value = int.parse(text, onError: (source) => null);
 * if (value == null) ... handle the problem
 * The onError function is only invoked if source is a String. It is not invoked
 * if the source is, for example, null.
 * @description Checks that the onError function is only invoked if source is
 * a String. It is not invoked if the source is, for example, null
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  bool called = false;
  Expect.throws(() {int.parse(null, onError: (s) {
    called = true;
    return 1;
  });});
  Expect.isFalse(called);

  dynamic val = 5;
  Expect.throws(() {int.parse(val, onError: (s) {
    called = true;
    return 1;
  });});
  Expect.isFalse(called);
}
