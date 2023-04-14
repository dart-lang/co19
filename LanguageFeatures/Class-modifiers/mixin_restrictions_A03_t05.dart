// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a mixin class declaration:
/// ...
/// - declares any non-trivial generative constructor
/// A trivial generative constructor is a generative constructor that:
/// - Is not a redirecting constructor _(Foo(...) : this.other(...);),
/// - declares no parameters (parameter list is precisely ()),
/// - has no initializer list (no : ... part, so no asserts or initializers, and
///   no explicit super constructor invocation),
/// - has no body (only ;), and
/// - is not external.
///
/// @description Check that it is not an error if a `mixin class` declares a
/// trivial generative constructor
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

mixin class M1 {
  M1();
  M1.named();
}

mixin class M2 {
  const M2();
  const M2.named();
}

base mixin class M3 {
  M3();
  M3.named();
}

base mixin class M4 {
  const M4();
  const M4.named();
}

abstract mixin class M5 {
  M5();
  M5.named();
}

abstract mixin class M6 {
  const M6();
  const M6.named();
}

abstract base mixin class M7 {
  M7();
  M7.named();
}

abstract base mixin class M8 {
  const M8();
  const M8.named();
}

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
  print(M5);
  print(M6);
  print(M7);
  print(M8);
}
