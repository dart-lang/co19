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
/// `C`. Test a class and external constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/static_type_helper.dart';

class C1 {
  external factory C1();
}

class C2 {
  external const factory C2();
}

main() {
  var c1 = C1.new;
  c1.expectStaticType<Exactly<C1 Function()>>();
  var c2 = C2.new;
  c2.expectStaticType<Exactly<C2 Function()>>();
}
