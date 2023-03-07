// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a declared or derived mixin
/// explicitly declares a constructor which is not a factory constructor.
/// @description Checks that it is no compile-time error if a derived mixin
/// explicitly declares a factory constructor.
/// @issue 24767
/// @author sgrekhov@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

class A {
}

class M {
  factory M() => new B();
}

class B implements M {}

class C = A with M;

main() {
  new C();
}
