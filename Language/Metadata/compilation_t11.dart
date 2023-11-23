// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error if the expression is not one of the
/// following:
///   • A reference to a compile-time constant variable.
///   • A call to a constant constructor.
/// @description Check that it is a compile time error, if called constructor
/// is not constant
/// @Issue #24281
/// @author a.semenov@unipro.ru

class A {
    A(int x);
}

  @A(10)
//^^^^^^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_ANNOTATION_CONSTRUCTOR
// ^
// [cfe] Cannot invoke a non-'const' constructor where a const expression is expected.
class B {}

main() {
  B? b;
}
