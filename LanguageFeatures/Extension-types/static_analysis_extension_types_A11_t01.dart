// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type is used as a
/// superinterface of a class, mixin, or enum declaration, or if an extension
/// type is used in a mixin application as a superclass or as a mixin.
///
/// @description Checks that it is a compile-time error if an extension type is
/// used as a superinterface of a class or a mixin, or enum declaration, or if
/// an extension type is used to derive a mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V(int id) {}

class C1 extends V {
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  C1(int id);

  int get id => 0;
}

class C2 implements V {
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  int get id => -1;
}

mixin M on V {
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  int get id => 0;
}
class C3 with V {
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  int get id => 0;
}

class C4 = Object with V;
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

enum E implements V {
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  e1, e2;
  int get id => 0;
}

main() {
  print(V);
  print(C1);
  print(C2);
  print(M);
  print(C3);
  print(C4);
}
