// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is a compile-time error to declare an extension
/// on a malbounded type.
/// @author sgrekhov22@gmail.com

class A<T extends A<T>> {}

extension on A<Null> {}
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension on A<A<Null>> {}
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(A);
}
