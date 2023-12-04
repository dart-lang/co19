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
/// • The name loadLibrary is bound to a function with signature
///   Future<void> loadLibrary(). This function returns a future f. When called,
///   the function causes an immediate import I′ to be executed at some future
///   time, where I′ is derived from Ii by eliding the word deferred and adding
///   a hide loadLibrary combinator clause. The execution of the immediate
///   import may fail for implementation specific reasons. For instance, I′
///   imports a different library than the one that the specified URI referred
///   to at compiletime; or an OS level file read error occurs; etc. We say that
///   the invocation of loadLibrary succeeds if f completes with a value, and
///   that the invocation fails if f completes with an error.
///
/// @description Checks that static type of `loadLibrary` is
/// `Future<void> Function()`
/// @author sgrekhov22@gmail.com

import "static_type_lib.dart" deferred as p;
import "../../../Utils/static_type_helper.dart";

main() {
  p.loadLibrary.expectStaticType<Exactly<Future<void> Function()>>();
}
