/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The assert statement has no effect in production mode.
 * @description Checks that the assert statement has no effect in production
 * mode.
 * @author vasya
 */

import '../../../Utils/expect.dart';

bool check() {
  Expect.fail("assert expression should not be evaluated");
}

main() {
  // TODO check if assert is effective
  assert (false);
  assert(check());
}
