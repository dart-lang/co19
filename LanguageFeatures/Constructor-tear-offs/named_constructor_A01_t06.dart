// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow tearing off named constructors.
///
/// If [C] denotes a class declaration and [C.name] is the name of a constructor
/// of that class, we allow you to tear off that constructors as:
///
///  C.name, or
///  C<typeArgs>.name
///
/// just as you can currently invoke the constructor as [C.name(args)], or
/// [C<typeArgs>.name(args)].
///
/// @description Checks that tearing off named constructor is allowed for a
/// non-generic class. Test factory constructor
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

bool called = false;

class C {
  C() {
    called = true;
  }
  factory C.f(int i) = D.new;
}

class D extends C {
  D(int i) : super();
}

main() {
  var v = C.f;
  v(42);
  Expect.isTrue(called);
}
