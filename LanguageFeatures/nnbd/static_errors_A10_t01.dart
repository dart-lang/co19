/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a named parameter that is part of a required
 * group is not bound to an argument at a call site
 *
 * @description Check that it is an error if a named parameter that is part of a
 * required group is not bound to an argument at a call site
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "package:meta/meta.dart";

class C {
  static void test1({@required int x, String y}) {}
  void test2({@required int x = 0, String y}) {}
}

void test3({@required int x = 0, String y}) {}

main() {
  C.test1(y: "");      //# 01: compile-time error
  C().test2(y: "");    //# 02: compile-time error
  test3(y: "");        //# 03: compile-time error
}
