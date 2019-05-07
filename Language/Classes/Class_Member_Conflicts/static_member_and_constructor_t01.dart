/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class. It is a compile-time error if C declares a
 * constructor named C.n and a static member with basename n.
 * @description Check that it is a compile-time error if C declares a
 * constructor named C.n and a static member with basename n
 * @author sgrekhov@unipro.ru
 */
class C {
  C.s() {}

  static set s(var value) {}  //# 01: compile-time error
  static void s() {}          //# 02: compile-time error
  static int s() => 1;        //# 03: compile-time error
  static int get s => 1;      //# 04: compile-time error
  static int s = 1;           //# 05: compile-time error
}

main() {
}
