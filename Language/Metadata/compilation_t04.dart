// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error if the expression is not one of the
/// following:
///   • A reference to a compile-time constant variable.
///   • A call to a constant constructor.
/// @description Check that if static class method is used as metadata, then a
/// compile time error is raised.
/// @author a.semenov@unipro.ru

class A {
  static int a() {
    return 10;
  }
}

  @A.a()
//^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ANNOTATION
//   ^
// [cfe] Couldn't find constructor 'A.a'.
class B {}

main() {
  B? b;
}
