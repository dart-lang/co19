// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An occurrence of `super._` as a declaration of a formal parameter
/// in a constructor is a compile-time error. This error also occurs in the case
/// where the super parameter has an explicitly declared type and/or default
/// value.
///
/// @description Checks that it is not an error to refer `super._` in a body of
/// a constructor or a method.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class A {
  final _ = () => 42;
}

class C extends A {
  Function v = () {};
  C() {
    v = super._;
  }

}

main() {
  C c = C();
  Expect.equals(42, c.v());
}
