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
 * in the list is not dynamic and is not assignable to [Iterable] or [Null]
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

  List l1  = [...?x1];
  List l2  = [...?x2];  //# 01: compile-time error
  List l3  = [...?x3];
  List l4  = [...?x4];
  List l5  = [...?x5];  //# 02: compile-time error
  List l6  = [...?x6];  //# 03: compile-time error
  List l7  = [...?x7];
  List l8  = [...?x8];
  List l9  = [...?x9];  //# 04: compile-time error
  List l10 = [...?x10]; //# 05: compile-time error
  List l11 = [...?x11]; //# 06: compile-time error
}
