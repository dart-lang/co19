// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When a generic class C declares a type parameter X, it is a
/// compile-time error if X occurs in a non-covariant position in a type which
/// specifies a superinterface of C
///
/// @description Checks that it is a compile-time error if a generic class `C`
/// declares a type parameter `X` which occurs in a non-covariant position in a
/// type which specifies a superinterface of `C`. Test an inline class
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

mixin class A<T> {}

inline class C1<T> implements A<void Function(T)> {
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  C1(this.id);
}

inline class C2<T> with A<void Function(T)> {
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  C2(this.id);
}

main() {
  C1(42);
  C2(42);
}
