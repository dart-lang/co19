// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion When assertions are not enabled, execution of an assertion
/// immediately completes normally
/// @description Checks that the assert statement has no effect if assertions are
/// disabled.
/// @author vasya

import '../../../Utils/expect.dart';

bool check() {
  Expect.fail("assert expression should not be evaluated");
  return false;
}

main() {
  if (!assertStatementsEnabled) {
    assert(check());
  }
}
