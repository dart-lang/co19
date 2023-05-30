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

inline class A<T> {
  final int id = 0;
}

inline class C<T> implements A<void Function(T)> {
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  final int id;
  C(this.id);
}

main() {
  C(42);
}
