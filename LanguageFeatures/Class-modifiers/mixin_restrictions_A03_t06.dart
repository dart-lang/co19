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
/// factory constructor
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

class M1 {
  M1();
  factory M1.f1() = M1;
  factory M1.f2() => M1();
}

base mixin class M2 {
  M2();
  factory M2.f1() = M2;
  factory M2.f2() => M2();
}

main() {
  print(M1);
  print(M2);
}
