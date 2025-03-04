// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error for a variable to be declared as late in any of the
/// following positions: in a formal parameter list of any kind; in a catch
/// clause; in the variable binding section of a c-style for loop, a for in loop,
/// an await for loop, or a for element in a collection literal.
///
/// @description Check that it is an error for a formal parameter to be declared
/// late. Test covariant formal parameters
/// @author sgrekhov@unipro.ru

class A {}

class C {
  void m1(covariant late A x) {}
//                  ^^^^
// [analyzer] SYNTACTIC_ERROR.EXTRANEOUS_MODIFIER
// [cfe] Can't have modifier 'late' here.
  void m2(A x, [covariant late A y]) {}
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void m3(A x, {covariant late A y}) {}
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set(covariant late A x) {}
//                   ^^^^
// [analyzer] SYNTACTIC_ERROR.EXTRANEOUS_MODIFIER
// [cfe] Can't have modifier 'late' here.
  C operator +(covariant late C other) => other;
//                       ^^^^
// [analyzer] SYNTACTIC_ERROR.EXTRANEOUS_MODIFIER
// [cfe] Can't have modifier 'late' here.
}

main() {
}
