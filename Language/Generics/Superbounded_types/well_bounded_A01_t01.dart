// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error if a variable with a
/// well-bounded type parameter is declared
/// @Issue 42415, 42429
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

main() {
  A a1;
  A<dynamic> a2;
  A<Object?> a3;
  A<void>    a5;
  A<Never>   a6;
  A<A<dynamic>> a7;
  A<A<Object?>> a8;
  A<A<void>>    a10;
  A<A<Never>>   a11;
  A<A> a12;
  A<A<A>> a13;
}
