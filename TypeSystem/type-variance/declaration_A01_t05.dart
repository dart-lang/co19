// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a variance modifier is specified
/// for a type parameter declared by a static extension, a generic function
/// type, a generic function or method, or a type alias.
///
/// @description Check that it is a compile-time error if a variance modifier is
/// specified for a type parameter declared by a type alias
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=variance

typedef AList1<in T> = List<T>;
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef AList2<out T> = List<T>;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef AList3<inout T> = List<T>;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(AList1);
  print(AList2);
  print(AList3);
}
