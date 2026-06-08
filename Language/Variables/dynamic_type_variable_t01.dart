// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a variable declaration does not explicitly specify a type,
/// the type of the declared variable(s) is dynamic, the unknown type.
///
/// @description Checks that no static warnings are produced when trying to
/// access various non-existent members and properties of a variable. It means
/// that the return type of the getter is dynamic.
/// @author iefremov

import "../../Utils/expect.dart";

main() {
  var foo;

  Expect.throws(() {
    foo.checkDynamic1 = null;
  }, (e) => e is NoSuchMethodError);
  Expect.throws(() {
    foo.checkDynamic2(1, 2, 3);
  }, (e) => e is NoSuchMethodError);
  Expect.throws(() {
    foo.checkDynamic3 = null;
  }, (e) => e is NoSuchMethodError);

  final boo = null;

  Expect.throws(() {
    boo.checkDynamic1 = null;
  }, (e) => e is NoSuchMethodError);
  Expect.throws(() {
    boo.checkDynamic2(1, 2, 3);
  }, (e) => e is NoSuchMethodError);
  Expect.throws(() {
    boo.checkDynamic3 = null;
  }, (e) => e is NoSuchMethodError);
}
