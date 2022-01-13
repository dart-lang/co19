// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of such an enum declaration, E, is defined as
/// introducing a (semantic) class, C, just like a similar class declaration.
/// ...
/// Declared members: For each member declaration of the enum declaration E, the
/// same member is added to the class C. This includes constructors (which must
/// be const generative or non-const factory constructors.)
///
/// @description Check that all const generative or non-const factory
/// constructors are added to class `C`
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

enum E {
  e1(-1),
  e2.named(-2);

  final int i1;

  const E(this.i1);
  const E.named(int i) : i1 = i;
  factory E.f(int i) => E.values[i];
}

main() {
  Expect.equals(-1, E.e1.i1);
  Expect.equals(-2, E.e2.i1);
  Expect.equals(-2, E.f(1).i1);
}
