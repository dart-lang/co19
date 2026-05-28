// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is a compile-time error to call a generic
/// function with an actual type argument which does not satisfy the bounds.
/// @author iarkh@unipro.ru

void testme<X extends num>() {}

main() {
  testme<String>();
//^
// [cfe] unspecified
// [analyzer] unspecified
  testme<dynamic>();
//^
// [cfe] unspecified
// [analyzer] unspecified
  testme<void>();
//^
// [cfe] unspecified
// [analyzer] unspecified
  testme<Object>();
//^
// [cfe] unspecified
// [analyzer] unspecified
}
