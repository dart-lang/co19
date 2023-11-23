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
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {
  int x;
  dynamic y;
  C.name(int i, dynamic d) : this.x = i, this.y = d {
    x = 42;
  }
}

main() {
  final dynamic dn = 3.14;
  var v = C.name;
  Expect.isTrue(v is C Function(int x, dynamic y));
  Expect.runtimeIsType<C Function(int x, dynamic y)>(v);
  var x = v(0, "Lily was here");
  Expect.equals(42, x.x);
  Expect.equals("Lily was here", x.y);
  var y = v(1, dn);
  Expect.equals(42, y.x);
  Expect.equals(dn, y.y);

  Expect.throws(() { v(dn, "test"); });
}
