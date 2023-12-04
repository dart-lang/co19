// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let Ii be an import directive that refers to a URI via the string
/// si. The semantics of Ii is specified as follows:
/// Case ⟨Semantics of deferred imports⟩. If Ii is a deferred import with prefix
/// p, a binding of p to a deferred prefix run-time namespace NSdeferred is
/// present in the library namespace of the current library L. Let NSimport,i be
/// the namespace imported from the library specified by Ii.
/// NSdeferred then has the following bindings:
/// ...
/// • For every top level function f named id in NSimport,i, a corresponding
///   function named id with the same signature as f. Calling the function
///   results in a dynamic error that occurs before any actual arguments are
///   evaluated. Closurizing the function also results in a dynamic error.
/// • For every top level getter g named id in NSimport,i, a corresponding
///   getter named id with the same signature as g. Calling the getter results
///   in a dynamic error.
/// • For every top level setter s named id= in NSimport,i, a corresponding
///   setter named id= with the same signature as s. Calling the setter results
///   in a dynamic error that occurs before the actual argument is evaluated.
///
/// @description Checks that calling a function from a deferred library before
/// `loadLibrary()` call results in a dynamic error that occurs before any
/// actual arguments are evaluated.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";
import "static_type_lib.dart" deferred as p;

String log = "";

class C {
  int value;
  C(this.value);
  int operator +(int other) {
    log = "C($value).+($other)";
    return value + other;
  }
}

main() {
  Expect.throws(() {
    p.someFunc(C(1) + 2);
  });
  Expect.equals("", log);
  Expect.throws(() {
    p.someSetter = C(2) + 3;
  });
  Expect.equals("", log);
}
