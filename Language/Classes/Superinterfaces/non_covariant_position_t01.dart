// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When a generic class C declares a type parameter X, it is a
/// compile-time error if X occurs in a non-covariant position in a type which
/// specifies a superinterface of C
///
/// @description Checks that it is a compile-time error if a generic class `C`
/// declares a type parameter `X` which occurs in a non-covariant position in a
/// type which specifies a superinterface of `C`
/// @author sgrekhov22@gmail.com

mixin class A<T> {}

class C1<T> extends A<void Function(T)> {}
//       ^
// [analyzer] unspecified
// [cfe] unspecified

class C2<T> implements A<void Function(T)> {}
//       ^
// [analyzer] unspecified
// [cfe] unspecified

class C3<T> with A<void Function(T)> {}
//       ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  C1();
  C2();
  C3();
}
