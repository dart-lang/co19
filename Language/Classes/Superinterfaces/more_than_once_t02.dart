// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if two elements in the type list of
/// the `implements` clause of a class `C` specifies the same type `T`.
///
/// @description Checks that it is a compile-time error if the same type appears
/// more than once in the `implements` clause. Test type aliases.
/// @author sgrekhov@unipro.ru

// @dart=3.12

abstract class I {}
abstract class J {}

typedef IAlias = I;
typedef NumAlias = num;

class C implements I, J, IAlias {}
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M implements I, J, IAlias {}
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum E implements I, J, IAlias {
//                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0;
}

extension type ET(int _) implements num, NumAlias {}
//                                       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
