/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String replaceRange(int start, int end, String replacement)
 * ...
 * The start and end indices must specify a valid range of this string.
 * That is 0 <= start <= end <= this.length
 * @description Checks that the start and end indices must specify a valid range
 * of this string
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {"123".replaceRange(-1, 2, "abc");}, (e) => e is RangeError);
  Expect.throws(() {"123".replaceRange(1, -2, "abc");}, (e) => e is RangeError);
  Expect.throws(() {"123".replaceRange(2, 1, "abc");}, (e) => e is RangeError);
  Expect.throws(() {"123".replaceRange(1, 10, "abc");}, (e) => e is RangeError);
}
