/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class. ... It is a compile-time error if the interface
 * of C has a method named n and a setter with basename n.
 * @description Check that it is a compile-time error if the interface
 * of C has a method named n and a setter with basename n.
 * @author sgrekhov@unipro.ru
 */
class C {
  void s() {}
  void _s() {}

  set s(var value) {}
  //  ^
  // [analyzer] COMPILE_TIME_ERROR.DUPLICATE_DEFINITION
  // [cfe] 's' is already declared in this scope.
  set _s(var value) {}
  //  ^^
  // [analyzer] COMPILE_TIME_ERROR.DUPLICATE_DEFINITION
  // [cfe] '_s' is already declared in this scope.
}

main() {
  new C();
}
