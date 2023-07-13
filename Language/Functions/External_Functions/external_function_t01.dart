// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An external function is a function whose body is provided
/// separately from its declaration. An external function may be a top-level
/// function, a method, a getter, a setter, or a non-redirecting constructor.
///
/// @description Checks that it is a compile-time error to declare a local
/// function as `external`
/// @author sgrekhov22@gmail.com

main() {
  external f();
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  external g([var x]);
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  external h({var x});
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  external m({required var x});
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
