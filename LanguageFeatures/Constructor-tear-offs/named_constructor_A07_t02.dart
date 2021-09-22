// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The constant-ness, identity and equality of the torn-off
/// constructor functions behave exactly the same as if they were tear-offs of
/// the corresponding static function. This means that a non-generic class
/// constructor always tears off to the same function value, as does an
/// uninstantiated tear off of a generic class constructor.
///
/// @description Checks that a non-generic class constructor always tears off to
/// the same function value: test named constructors
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  C.name1() {}
  C.name2(int i) {}
  C.name3(int i, String s, List l) {}
}

main() {
  const v1 = C.name1;
  const v2 = C.name1;
  Expect.equals(v1, v2);
  const CheckIdentical(v1, v2);

  var v4 = C.name2;
  var v5 = C.name2;
  Expect.equals(v4, v5);
  Expect.identical(v4, v5);

  const v7 = C.name3;
  const v8 = C.name3;
  Expect.equals(v7, v8);
  const CheckIdentical(v7, v8);

  Expect.notEquals(v1, v4);
  Expect.notEquals(v2, v7);
  Expect.notEquals(v5, v8);
}
