// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a type parameter of an extension
/// type declaration occurs in a non-covariant position in the representation
/// type.
///
/// @description Checks that it is a compile-time error if a type parameter of
/// an extension type occurs in a non-covariant position in the representation
/// type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V<T extends num>(void Function(T) f) {
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(V);
}
