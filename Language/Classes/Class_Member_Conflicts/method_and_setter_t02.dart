// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `C` be a class.
/// ...
/// It is a compile-time error if the interface of C has a method named `n` and
/// a setter with basename `n`.
///
/// @description Check that it is a compile-time error if an interface has a
/// method named `n` and an implicit setter with basename `n`.
/// @author sgrekhov22@gmail.com

class C {
  void s() {}
  void _s() {}

  int s = 0;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  var _s = '';
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  void s() {}
  void _s() {}

  int s = 0;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  var _s = '';
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
}
