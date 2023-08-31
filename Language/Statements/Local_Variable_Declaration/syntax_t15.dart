// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declared type of a local variable with a declaration of one
/// of the forms late? var v = e; late? final v = e; const v = e; is determined
/// as follows:
/// • If the static type of e is Null then the declared type of v is dynamic.
///
/// @description Checks that a variable declaration statement `var id = null;`
/// introduces a new variable `id` with `dynamic` static type into the innermost
/// enclosing scope.
/// @author vasya

import '../../../Utils/expect.dart';

class C {}

main() {
  var id = null;
  Expect.throws(() {
    id.whatever;
  });
  id = false;
  id = "";
  id = 2;
  id = new C();
  id = () {};
}
