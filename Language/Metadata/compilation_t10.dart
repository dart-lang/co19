// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error if the expression is not one of the
/// following:
///   • A reference to a compile-time constant variable.
///   • A call to a constant constructor.
/// @description Check that it is a compile time error, if mandatory arguments
/// are missing
/// @Issue #24281
/// @author a.semenov@unipro.ru

class A {
    const A(int x);
}

  @A
//^^
// [analyzer] COMPILE_TIME_ERROR.NO_ANNOTATION_CONSTRUCTOR_ARGUMENTS
// ^
// [cfe] This can't be used as an annotation; an annotation should be a reference to a compile-time constant variable, or a call to a constant constructor.
class B {}

main() {
  B? b;
}
