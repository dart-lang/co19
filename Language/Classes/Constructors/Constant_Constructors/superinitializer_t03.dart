// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The superinitializer that appears, explicitly or implicitly,
/// in the initializer list of a constant constructor must specify a constant
/// constructor of the superclass of the immediately enclosing class or a
/// compile-time error occurs.
/// @description Checks that there is no a compile error if an implicit
/// superinitializer call is a call of a constant constructor
/// @author ngl@unipro.ru


class C {
  const C();
}

class A extends C {
  const A();
}

main() {
  const A();
}
