// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The superinitializer that appears, explicitly or implicitly,
/// in the initializer list of a constant constructor must specify a constant
/// constructor of the superclass of the immediately enclosing class or a
/// compile-time error occurs.
/// @description Checks that compile error is produced if implicit
/// superinitializer is a call to non const constructor. Test type alias
/// @author sgrekhov@unipro.ru

class C {
  C();
}
typedef CAlias = C;

class A extends CAlias {
  const A();
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  const A();
}
