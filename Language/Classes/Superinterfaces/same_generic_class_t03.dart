// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a class C has two superinterfaces
/// that are different instantiations of the same generic class
///
/// @description Checks that it is a compile-time error if a class `C` has two
/// superinterfaces that are different instantiations of the same generic class.
/// Test extends/with case
/// @author sgrekhov22@gmail.com

mixin class A<T> {}
mixin class B1<T> implements A<T> {}
mixin class B2<T> implements A<T> {}

class C1 extends A<int> with A {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

class C2 extends A<num> with A<int> {}
//                           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C3<T> extends A<T> with A<int> {}
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C4<T extends num> extends A<T> with A<num> {}
//                                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class CB1 extends B1<int> with B2 {}
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

class CB2 extends B1<num> with B2<int> {}
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

class CB3<T> extends B1<T> with B2<int> {}
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

class CB4<T extends num> extends B1<T> with B2<num> {}
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
