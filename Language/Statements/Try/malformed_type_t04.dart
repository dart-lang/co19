/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is a malformed type, then performing a match causes a run
 * time error. It is a static warning if T is a malformed type.
 * @description Checks that if T is malformed, then performing a match causes
 * new runtime error.
 * @static-warning
 * @author ilya
 */
import '../../../Utils/expect.dart';

var error = new Object();

f() {
  try {
    throw error;
    Expect.fail("This code shouldn't be executed");
  } on Unavailable catch(_) { /// static type warning no such type
    Expect.fail("This code shouldn't be executed");
  }
}

main() {
  try {
    f();
    Expect.fail("This code shouldn't be executed");
  } on ExpectException catch (e) {
    // one of Expect.fail above happened
    Expect.fail(e.toString());
  } catch (e) {
    Expect.isFalse(e is ExpectException);
    Expect.notEquals(error, e);
  }
}
