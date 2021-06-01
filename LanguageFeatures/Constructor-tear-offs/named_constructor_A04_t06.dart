// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Similarly, [params] is almost exactly the same parameter list
/// as the constructor [C.name], with the one exception that initializing
/// formals are represented by normal parameters with the same name and type.
/// All remaining properties of the parameters are the same as for the
/// corresponding constructor parameter, including any default values, and
/// [args] is an argument list passing those parameters to [C.name] directly as
/// they are received.
///
/// @description Checks that initializing formals are represented by normal
/// parameters with the same name and type.

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  int x;
  dynamic y;
  C.name(this.x, this.y);
}

dynamic d = 0.5;

main() {
  var v = C.name;
  Expect.isTrue(v is C Function(int x, dynamic y));
  v(42, "I am strong");

  Expect.throws(() { v(d, "test"); });
  Expect.throws(() { v(1, d); });
}
