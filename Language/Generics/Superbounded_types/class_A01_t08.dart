// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type [T] which is not well-bounded is a
/// compile-time error.
/// @description Checks that compile error is not thrown when class with type
/// parameter which extends super bounded type is declared
/// @Issue 37034
/// @author iarkh@unipro.ru


class A<T extends A<T>> {}

class B1<X extends A<Object?>> {}
class B2<X extends A<dynamic>> {}
class B3<X extends A<void>> {}
class B4<X extends A<Never>> {}

main() {
}
