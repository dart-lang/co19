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
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

import "dart:async";

main() {
  dynamic x1;
  Object x2;
  List x3;
  Set x4;
  Map x5;
  int x6;
  Iterable x7;
  Null x8;
  void x9;
  Future x10;
  FutureOr x11;

  Set s1  = {...?x1};
  Set s2  = {...?x2};  //# 01: compile-time error
  Set s3  = {...?x3};
  Set s4  = {...?x4};
  Set s5  = {...?x5};  //# 02: compile-time error
  Set s6  = {...?x6};  //# 03: compile-time error
  Set s7  = {...?x7};
  Set s8  = {...?x8};
  Set s9  = {...?x9};  //# 04: compile-time error
  Set s10 = {...?x10}; //# 05: compile-time error
  Set s11 = {...?x11}; //# 06: compile-time error
}
