// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • An expression of one of the forms ~e, e1 ^ e2, e1 & e2, e1 | e2, e1 >> e2
///   or e1 << e2, where e1 and e2 are constant expressions that evaluate to an
///   integer value or to null.
/// @description Checks that it is a compile-time error when an expression of
/// the form ~e where e does not evaluate to an integer value, is used to
/// initialize a constant variable.
/// @author kaigorodov

final constList = const [
  ~"oneoneeleven"
//^
// [analyzer] unspecified
// [cfe] unspecified
];

main() {
  print(constList);
}
