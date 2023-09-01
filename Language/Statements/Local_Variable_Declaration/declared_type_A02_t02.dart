// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declared type of a local variable with a declaration of one
/// of the forms late? var v = e; late? final v = e; const v = e; is determined
/// as follows:
/// • If the static type of e is Null then the declared type of v is dynamic.
///
/// @description Checks that a variable declaration statements
/// `late? var v = null; late? final v = null; const v = null;` introduce a new
/// variable `v` with `dynamic` static type into the innermost enclosing scope.
/// @author vasya

import '../../../Utils/expect.dart';

class C {}

test1() {
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

test2() {
  late var id = null;
  Expect.throws(() {
    id.whatever;
  });
  id = false;
  id = "";
  id = 2;
  id = new C();
  id = () {};
}

main() {
  late final v1 = null;
  final v2 = null;
  const v3 = null;

  Expect.throws(() {
    v1.whatever;
  });
  Expect.throws(() {
    v2.whatever;
  });
  Expect.throws(() {
    v3.whatever;
  });

  test1();
  test2();
}
