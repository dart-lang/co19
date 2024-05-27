// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An occurrence of `super._` as a declaration of a formal parameter
/// in a constructor is a compile-time error. This error also occurs in the case
/// where the super parameter has an explicitly declared type and/or default
/// value.
///
/// @description Checks that it is a compile-time error to refer `super._` as a
/// formal parameter of a constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class A {
  final _;
  const A(this._);
}

class C1 extends A {
  C1(super._);
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  const C1.cnst(super._);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 extends A {
  int _;
  C2(int v, super._) : this._ = v;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
}
