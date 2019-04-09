/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion N/A
 * @description Checks that triple right shift argument cannot be negative
 * (see co19 Issue #355 for more details)
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=triple-shift

main() {
  int i1 = 12345;
  int i2 = -11;
  int i3 = -12345;

  var res1 = i1 >>> i2;    //# 01: compile-time error
  var res2 = i1 >>> i3;    //# 02: compile-time error
  var res3 = i2 >>> i3;    //# 03: compile-time error
  var res4 = i3 >>> i2;    //# 04: compile-time error

  var res5 = i1 >>> -2;    //# 05: compile-time error
  var res6 = 2000 >>> i3;  //# 06: compile-time error
  var res7 = 2000 >>> -14; //# 07: compile-time error
}
