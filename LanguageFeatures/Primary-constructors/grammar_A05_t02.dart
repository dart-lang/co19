// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a factory constructor declaration of the form
/// `factory C(...` optionally starting with zero or more of the modifiers
/// `const`, `augment`, or `external`. Assume that `C` is the name of the
/// enclosing class, mixin class, enum, or extension type. In this situation,
/// the declaration declares a constructor whose name is `C`.
///
/// Without this special rule, such a declaration would declare a constructor
/// named `C.C`. With this rule it declares a constructor named `C`, which is
/// the same as today.
///
/// @description Check that in case of a factory constructor declaration of the
/// form `factory C(...` the declaration declares a constructor whose name is
/// `C`. Test a mixin class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,declaring-constructors

import '../../Utils/static_type_helper.dart';

mixin class C1 {
  const C1.foo();
  const factory C1() = C1.foo;
}

mixin class C2 {
  C2.foo();
  factory C2() => C2.foo();
}

mixin class C3 {
  const C3.foo();
  const factory C3();

  augment const factory C3() = C3.foo;
}

mixin class C4 {
  C4.foo();
  factory C4();

  augment factory C4() => C4.foo();
}

mixin class C5 {
  external factory C5();
}

mixin class C6 {
  external const factory C6();
}

main() {
  var c1 = C1.new;
  c1.expectStaticType<Exactly<C1 Function()>>();
  var c2 = C2.new;
  c2.expectStaticType<Exactly<C2 Function()>>();
  var c3 = C3.new;
  c3.expectStaticType<Exactly<C3 Function()>>();
  var c4 = C4.new;
  c4.expectStaticType<Exactly<C4 Function()>>();
  var c5 = C5.new;
  c5.expectStaticType<Exactly<C5 Function()>>();
  var c6 = C6.new;
  c6.expectStaticType<Exactly<C6 Function()>>();
}
