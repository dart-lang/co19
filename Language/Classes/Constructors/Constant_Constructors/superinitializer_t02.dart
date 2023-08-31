// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The superinitializer that appears, explicitly or implicitly,
/// in the initializer list of a constant constructor must specify a constant
/// constructor of the superclass of the immediately enclosing class or a
/// compile-time error occurs.
/// @description Checks that compile error is produced if explicit
/// superinitializer is a call to non const constructor
/// @author ilya


class C {
  const C();
  C.nonConst();
}

class A extends C {
  const A() : super.nonConst();
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  const A();
}
