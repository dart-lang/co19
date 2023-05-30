// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a class C has two superinterfaces
/// that are different instantiations of the same generic class
///
/// @description Checks that it is a compile-time error if a class `C` has two
/// superinterfaces that are different instantiations of the same generic class.
/// Test implements/implements case
/// @author sgrekhov22@gmail.com

class A<T> {}
class B1<T> implements A<T> {}
class B2<T> implements A<T> {}

class C1 implements A<int>, A {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

class C2 implements A<num>, A<int> {}
//                          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C3<T> implements A<T>, A<int> {}
//                           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C4<T extends num> implements A<T>, A<num> {}
//                                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class CB1 implements B1<int>, B2 {}
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

class CB2 implements B1<num>, B2<int> {}
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

class CB3<T> implements B1<T>, B2<int> {}
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

class CB4<T extends num> implements B1<T>, B2<num> {}
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  C1();
  C2();
  C3();
  C4();
  CB1();
  CB2();
  CB3();
  CB4();
}
