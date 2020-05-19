/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluating a hexadecimal integer literal with numeric value i is a
 * compile-time error unless -2^63 <= i <= 2^64
 * @description Checks valid compile-time integer constants
 * @author sgrekhov@unipro.ru
 */

import '../../../Utils/expect.dart';

main() {
  var i =(0x7FFFFFFFFFFFFFFF + 1) ~/ 3;
  Expect.equals(-3074457345618258602, i);
  var j = 0x7FFFFFFFFFFFFFFF;
  Expect.equals(9223372036854775807, j);
}
