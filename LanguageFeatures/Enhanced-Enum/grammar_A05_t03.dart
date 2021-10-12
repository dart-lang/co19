// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the enum declaration contains any
/// generative constructor which is not const.
//
// We can allow omitting the const on constructors since it’s required, so we
// can just assume it’s there. That’s a convenience we can also add at any later
// point.
///
/// @description Check that non constant factory constructor is allowed
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

enum E {
  e1,
  e2,
  e3;
  const E();

  factory E.f() => e1;

  E get getInstance => E.f();
}

main() {
  Expect.equals(E.e1, E.e2.getInstance);
}
