// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a class C has two superinterfaces
/// that are different instantiations of the same generic class
///
/// @description Checks that it is a compile-time error if a class `C` has two
/// superinterfaces that are different instantiations of the same generic class.
/// @author sgrekhov22@gmail.com

class A<T> {}

class C1 extends A<int> implements A {}
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

class C2 extends A<num> implements A<int> {}
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C3<T> extends A<T> implements A<int> {}
//                                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  C1();
  C2();
  C3();
}
