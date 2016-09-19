/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is a malformed type, then performing a match causes a run
 * time error. It is a static warning if T is a malformed type.
 * @description Checks that if T is malformed, compile error is raised.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

import 'try_lib.dart' as p; // class Foo declared here

main() {
  try {
    throw new p.Foo();
    Expect.fail("This code shouldn't be executed");
  } on p.Foo catch (ok) {
  } on Foo catch (p1, p2) {
    Expect.fail("This code shouldn't be executed");
  }
}
