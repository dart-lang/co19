/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int parse(String source, {int radix, int onError(String source)})
 * Parse source as a, possibly signed, integer literal and return its value.
 *
 * The source must be a non-empty sequence of base-radix digits, optionally
 * prefixed with a minus or plus sign ('-' or '+').
 * ...
 * @description Checks that it is a FormatException if source represents value
 * outside int64 range
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {int.parse("9223372036854775808");},
      (e) => e is FormatException); //maximum int64 + 1
  Expect.throws(() {int.parse("-9223372036854775809");},
      (e) => e is FormatException); //minimum int64 - 1
}
