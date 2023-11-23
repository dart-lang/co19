// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant object expression invokes a constant constructor.
/// constObjectExpression:
///   const type ('.' identifier)? arguments
/// ;
/// @description Checks that it is a compile-time error if
/// a constant object expression is missing the type name.
/// @author msyabro

class A {
  final int i;
  const A(this.i);
}

main() {
  const (42);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
