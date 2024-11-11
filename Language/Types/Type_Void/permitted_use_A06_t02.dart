// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// ...
/// - In a null coalescing expression `e1 ?? e2`, `e2` may have type `void`.
///
/// @description Checks that if in a null coalescing expression `e1 ?? e2`, `e2`
/// has type `void` then the static type of the whole expression is also `void`
/// and it is a compile-time error to use it.
/// @author sgrekhov22@gmail.com

main() {
  void v = 0;
  int? e1 = (2 > 1) ? 1 : null;
  var x1 = e1 ?? v;
  print(x1);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  int? e2 = (2 > 1) ? null : 1;
  var x2 = e2 ?? v;
  print(x2);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}
