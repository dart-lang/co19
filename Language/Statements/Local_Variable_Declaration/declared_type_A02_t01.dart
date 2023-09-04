// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declared type of a local variable with a declaration of one
/// of the forms late? var v = e; late? final v = e; const v = e; is determined
/// as follows:
/// • If the static type of e is Null then the declared type of v is dynamic.
///
/// @description Checks that the variable declaration statements
/// `late? var v = e; late? final v = e; const v = e;` introduce a new variable
/// `v` with `dynamic` static type into the innermost enclosing scope.
/// @author vasya

import '../../../Utils/expect.dart';

class C {}

test1() {
  var id;
  Expect.throws(() {
    id.whatever;
  });
  id = false;
  id = "";
  id = 2;
  id = C();
  id = () {};
}

test2() {
  late var id;
  Expect.throws(() {
    id.whatever;
  });
  id = false;
  id = "";
  id = 2;
  id = C();
  id = () {};
}

main() {
  test1();
  test2();
}
