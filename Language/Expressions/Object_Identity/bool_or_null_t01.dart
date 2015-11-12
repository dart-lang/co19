/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The predefined Dart function identical() is defined such that
 * identical(c1, c2) iff:
 *  • c1 evaluates to either null or an instance of bool and c1 == c2.
 * @description Checks that object is identical() to null iff it equals to
 * null
 * @author ilya
 */
import "../../../Utils/expect.dart";

var nil = null;
var notNil = [];

main() {
  var nil2;
  Expect.isTrue(identical(null, null));
  Expect.isTrue(identical(null, nil));
  Expect.isTrue(identical(nil, nil2));

  Expect.isFalse(identical(null, notNil));
  Expect.isFalse(identical(null, () {}));
}
