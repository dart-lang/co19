// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to read a local variable when the
/// variable is potentially unassigned unless the variable is non-`final` and
/// has nullable type, or is `late`.
///
/// @description Check that it is an error if a potentially non-nullable local
/// variable which has no initializer expression and is not marked `late` is
/// read before it is definitely assigned. Test a variable of type
/// `FutureOr<Never>`.
/// @author sgrekhov@unipro.ru

import "dart:async";

class C {
  static void test() {
    FutureOr<Never> f;
    f.toString();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void test2() {
    FutureOr<Never> f;
    f.toString();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  FutureOr<Never> f;
  f.toString();
//^
// [analyzer] unspecified
// [cfe] unspecified

  Function foo = () {
    FutureOr<Never> f;
    f.toString();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  };
  print(C);
}
