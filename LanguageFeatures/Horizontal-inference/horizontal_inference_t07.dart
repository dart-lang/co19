// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks the case when type is inferred from return type of a
/// function and this function may return different types
/// @author sgrekhov22@gmail.com

class C1 {
  void c1() {}
}
class C2 extends C1 {
  void c2() {}
}

void f1<T, U>(void Function(T, U) a, T Function(U) b) {}

main() {
  f1((t, u) {
    t.c2();
//    ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_METHOD
// [cfe] The method 'c2' isn't defined for the class 'C1'.
  }, (u) {
    return 1 > 2 ? C2() : C1();
  });
}
