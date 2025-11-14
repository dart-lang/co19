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
/// `C`. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,declaring-constructors

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C1 {
  final int v;
  const C1.foo(this.v);
  const factory C1(int v) = C1.foo;
}

class C2 {
  int v;
  C2.foo(this.v);
  factory C2(int v) => C2.foo(v + 1);
}

class C3 {
  final int v;
  const C3.foo(this.v);
  const factory C3(int v);

  augment const factory C3(int v) = C3.foo;
}

class C4 {
  int v;
  C4.foo(this.v);
  factory C4(int v);

  augment factory C4(int v) => C4.foo(v + 1);
}

class C5 {
  external factory C5();
}

class C6 {
  external const factory C6();
}

main() {
  var c1 = C1.new;
  Expect.equals(1, c1(1).v);
  var c2 = C2.new;
  Expect.equals(2, c2(1).v);
  var c3 = C3.new;
  Expect.equals(1, c3(1).v);
  var c4 = C4.new;
  Expect.equals(2, c4(1).v);
  var c5 = C5.new;
  c5.expectStaticType<Exactly<C5 Function()>>();
  var c6 = C6.new;
  c6.expectStaticType<Exactly<C6 Function()>>();
}
