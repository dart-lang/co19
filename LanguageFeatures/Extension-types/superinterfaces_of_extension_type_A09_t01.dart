// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an extension type declaration named Name, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
/// ...
/// A compile-time error occurs if a type variable declared by DV occurs in a
/// non-covariant position in V1.
///
/// @description Checks that it is a compile-time error if a type variable
/// declared by `DV` occurs in a non-covariant position in `V1`.
/// @author sgrekhov22@gmail.com
/// @issue 53803

// SharedOptions=--enable-experiment=inline-class

class A<T> {}

extension type ET<T>(A<Never> _) implements A<void Function(T)> {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET);
}
