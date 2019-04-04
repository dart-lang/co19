/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A spread element in a map literal has a static type that is not [dynamic] and
 * not a subtype of [Map<Object, Object>].
 * @description Checks that compile error is thrown if null-aware spread element
 * in the map is not dynamic, is not assignable to [Map] and is not [null]
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

  Map m1  = {...?x1};
  Map m2  = {...?x2};  //# 01: compile-time error
  Map m3  = {...?x3};  //# 02: compile-time error
  Map m4  = {...?x4};  //# 03: compile-time error
  Map m5  = {...?x5};
  Map m6  = {...?x6};  //# 04: compile-time error
  Map m7  = {...?x7};  //# 05: compile-time error
  Map m8  = {...?x8};
  Map m9  = {...?x9};  //# 06: compile-time error
  Map m10 = {...?x10}; //# 07: compile-time error
  Map m11 = {...?x11}; //# 08: compile-time error
}
