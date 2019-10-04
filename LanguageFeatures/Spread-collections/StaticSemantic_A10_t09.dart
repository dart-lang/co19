/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A spread element in a list or set literal has a static type that is not
 * dynamic and not a subtype of Iterable<Object>.
 * @description Checks that compile error is thrown if null-aware spread element
 * in the sett is not dynamic and is not assignable to [Iterable] or [Null]
 * @author iarkh@unipro.ru
 */

import "dart:async";

main() {
  Object x1;
  Map x2;
  int x3;
  void x4;
  Future x5;
  FutureOr x6;

  Set s1 = {...?x1}; //# 01: compile-time error
  Set s2 = {...?x2}; //# 02: compile-time error
  Set s3 = {...?x3}; //# 03: compile-time error
  Set s4 = {...?x4}; //# 04: compile-time error
  Set s5 = {...?x5}; //# 05: compile-time error
  Set s6 = {...?x6}; //# 06: compile-time error
}
