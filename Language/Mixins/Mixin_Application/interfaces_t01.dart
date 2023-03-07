// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the mixin application declares support for interfaces, the
/// resulting class implements those interfaces.
/// @description Checks that if the mixin application declares support for
/// interfaces and the resulting class implements those interfaces then no
/// static warning occurs
/// @author sgrekhov@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

abstract class I {
  num get g;
}

class A {
}

class M {
}

abstract class B = A with M implements I;

class C implements B {
  num get g => 0;
}

main() {
  C c = new C();
  c.g;
}
