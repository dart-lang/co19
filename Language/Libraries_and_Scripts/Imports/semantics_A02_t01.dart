// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that for every top-level declaration in the imported
/// library a corresponding declaration with the same name created in the
/// current library. Calling the imported name results in a runtime error.
/// @Issue 33118
/// @issue 42491
/// @author ngl@unipro.ru

import "../../../Utils/expect.dart";
import "static_type_lib.dart" deferred as p;

main() {
  Expect.throws(() { p.someFunc(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { p.someGetter; }, (e) => e is NoSuchMethodError);
  Expect.throws(() { p.someSetter = 2; }, (e) => e is NoSuchMethodError);
  Expect.throws(() { p.Func; }, (e) => e is NoSuchMethodError);
}
