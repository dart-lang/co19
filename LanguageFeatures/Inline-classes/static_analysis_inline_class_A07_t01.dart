// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an inline type is used as a
/// superinterface of a class or a mixin, or if an inline type is used to derive
/// a mixin.
///
/// @description Checks that it is a compile-time error if an inline type is
/// used as a superinterface of a class or a mixin, or if an inline type is used
/// to derive a mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V {
  final int id;
  V(this.id);
}

class C1 extends V {
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  C1(int id) : super(id);
}

class C2 implements V {
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  int get id => -1;
}

mixin M on V {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified

class C3 with V {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

class C4 = Object with V;
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(V);
  print(C1);
  print(C2);
  print(M);
  print(C3);
  print(C4);
}
