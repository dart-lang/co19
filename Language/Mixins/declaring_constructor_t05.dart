// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to derive a mixin from a class that
/// declares a generative constructor, or from a class that has a superclass
/// other than Object.
///
/// @description Checks that it is no compile-time error if a derived mixin
/// explicitly declares a factory constructor.
/// @issue 24767
/// @author sgrekhov@unipro.ru

class A {
}

mixin class M {
  factory M() => new B();
}

class B implements M {}

class C extends A with M {
}

main() {
  new C();
}
