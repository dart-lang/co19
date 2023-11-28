// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error to declare a class with a type
/// parameter whose bound is a super-bounded type
/// @Issue 37034
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

class B1<X extends A<Object?>> {}
class B2<X extends A<dynamic>> {}
class B3<X extends A<void>> {}
class B4<X extends A<Never>> {}

main() {
  B1();
  B2();
  B3();
  B4();
}
