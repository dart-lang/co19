// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We will introduce syntax allowing you to explicitly instantiate a
/// function tear-off and a type literal for a generic class. The former for
/// consistency with constructor tear-offs, the latter to introduce in-line
/// types without needing a typedef, like we did for function types. And we do
/// both now because they share the same grammar productions.
///
/// Example:
///
///   T id<T>(T value) => value;
///   var idInt = id<int>; // Explicitly instantiated tear-off, saves on writing function types.
/// and
///   Type intList = List<int>; // In-line instantiated type literal.
///
/// @description Checks example from the Spec - tests negative cases.
/// @author iarkh@unipro.ru

T id<T>(T value) => value;
var idInt = id<int>;

main() {
  idInt(3.14);
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  idInt([]);
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  idInt("String");
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  idInt(null);
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  idInt<double>(3.14);
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
