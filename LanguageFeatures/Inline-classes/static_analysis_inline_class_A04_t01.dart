// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a type parameter of an inline
/// class occurs in a non-covariant position in the representation type.
///
/// @description Checks that it is a compile-time error if a type parameter of
/// an inline class occurs in a non-covariant position in the representation
/// type
/// @author sgrekhov22@gmail.com
// SharedOptions=--enable-experiment=inline-class

inline class V<T extends num> {
  final void Function(T) f;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  V(this.f);
}

main() {
  print(V);
}
