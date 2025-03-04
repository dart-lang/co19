// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not a compile time error to write to a `final` non-local or
/// instance variable if that variable is declared `late` and does not have an
/// initializer.
///
/// @description Check that it is not a compile time error to write to a
/// non-local `final` variable if that variable is declared `late` and does not
/// have an initializer.
/// @author sgrekhov@unipro.ru
/// @issue 39684

import "../../Utils/expect.dart";

late final g;

class C {
  static late final s;
  late final v;
}

main() {
  g = "Lily";
  C.s = "was";
  C c = new C();
  c.v = "here";

  Expect.equals("Lily", g);
  Expect.equals("was", C.s);
  Expect.equals("here", c.v);
}
