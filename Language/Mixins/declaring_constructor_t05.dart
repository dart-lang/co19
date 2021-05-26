// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a declared or derived mixin
/// explicitly declares a constructor.
/// @description Checks that it is a compile-time error if a derived mixin
/// explicitly declares a factory constructor.
/// @issue 24767
/// @author sgrekhov@unipro.ru


class A {
}

class M {
  factory M() {}
}

class C extends A with M {
}

main() {
  new C();
}
