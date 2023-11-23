// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When a generic class C declares a type parameter X, it is a
/// compile-time error if X occurs in a non-covariant position in a type which
/// specifies a superinterface of C
///
/// @description Checks that it is a compile-time error if a generic class `C`
/// declares a type parameter `X` which occurs in a non-covariant position in a
/// type which specifies a superinterface of `C`. Test an extension type and a
/// type alias
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type A<T>(int id) {}

typedef B<T> = void Function(T);

extension type C<T>(int id) implements A<B<T>> {
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
