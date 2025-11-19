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
/// `C`. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

enum E1 {
  e0.foo(1);

  final int v;
  const E1.foo(this.v);
  factory E1() => E1.e0;
}

enum E2 {
  e0.foo(2);

  final int v;
  const E2.foo(this.v);
  factory E2();
  augment factory E2() => E2.e0;
}

main() {
  var e1 = E1.new;
  Expect.equals(1, e1().v);
  var e2 = E2.new;
  Expect.equals(2, e2().v);
}
