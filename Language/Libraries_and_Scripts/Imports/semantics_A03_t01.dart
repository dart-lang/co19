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
/// • For every class, mixin, enum, and type alias declaration named id in
///   NSimport,i, a corresponding getter named id with return type Type. Calling
///   the getter results in a dynamic error.
///
/// @description Checks that for every class, mixin, enum, and type alias
/// declaration in the imported library a corresponding getter with the same
/// name and return type `Type` is present in the namespace denoted by the
/// deferred import prefix. An invocation of this getter is a dynamic error.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";
import "static_type_lib.dart" deferred as p;

main() {
  Expect.throws(() {
    Type t = p.SomeClass;
  });
  Expect.throws(() {
    Type t = p.SomeClassAlias;
  });
  Expect.throws(() {
    Type t = p.SomeEnum;
  });
  Expect.throws(() {
    Type t = p.SomeMixin;
  });
}
