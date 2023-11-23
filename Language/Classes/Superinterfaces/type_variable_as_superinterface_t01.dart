// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the implements clause of a class
/// C species a type variable as a superinterface.
///
/// @description Checks that it is a compile-time error when the type expression
/// in a class's implements clause denotes a type variable.
/// @author rodionov

class A<T> implements T {}
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

class B<T extends num> implements T {}
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  A();
  B();
}
