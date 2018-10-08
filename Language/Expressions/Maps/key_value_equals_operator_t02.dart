/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the key of an entry in a constant
 * map literal is an instance of a class that implements the operator == unless
 * the key is a string or integer, a literal symbol or the result of invoking a
 * constant constructor of class Symbol.
 * @description Checks that there is no compile-error if const map literal has
 * as the key entry a string or integer, a literal symbol or the result of
 * invoking a constant constructor of class Symbol.
 * @author ngl@unipro.ru
 */

import '../../../Utils/expect.dart';

main() {
  var x1 = const {"abc": 1};
  Expect.equals(1, x1["abc"]);
  var x2 = const {1: 1};
  Expect.equals(1, x2[1]);
  var x3 = const {#abc: 1};
  Expect.equals(1, x3[#abc]);
  var x4 = const {const Symbol("abc"): 1};
  Expect.equals(1, x4[const Symbol("abc")]);
}
