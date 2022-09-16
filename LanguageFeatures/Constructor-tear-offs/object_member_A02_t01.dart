// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When C is a type literal, C<int> is regular-bounded parameterized
/// type, and C.m is the name of a constructor, an expression of the form
/// C<int>.m(...) denotes an instance creation and C<int>.m denotes a
/// constructor tearoff, and they are not errors. When C.m is not a constructor
/// name, those forms are a compile-time error, even in the case where Type has
/// a member named m (for instance, C<int>.toString() is an error unless
/// C.toString is a constructor).
///
/// @description Checks that if C is a type literal, C<int> is regular-bounded
/// parameterized type, and C.m is not a constructor name, those forms are a
/// compile-time error, even in the case where Type has a member named m
/// @author sgrekhov@unipro.ru

class C<T> {
}

main() {
  C<int>.toString();
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C.toString();
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.toString;
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C.toString;
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
