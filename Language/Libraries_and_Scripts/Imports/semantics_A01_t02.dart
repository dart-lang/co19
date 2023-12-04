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
/// @description Checks that call of `loadLibrary` causes an immediate import of
/// the deferred library
/// @author ngl@unipro.ru

import "../../../Utils/expect.dart";
import "static_type_lib.dart" deferred as p;

void testLoaded() {
  Expect.equals(1, p.someFunc());
  Expect.equals(3, p.someVar);
  Expect.equals(2, p.someGetter);
  p.someSetter = 1;
  p.Func;
  Expect.isTrue(p.loadLibrary() is Future<void>);
  Expect.runtimeIsType<Future<void>>(p.loadLibrary());
}

main()  {
  asyncStart();
  p.loadLibrary().then((v) {
    testLoaded();
    asyncEnd();
  },
  onError: (e) {
    Expect.fail("Library should be loaded");
  });
}
