// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library Expect;
import "dart:async";

part "expect_common.dart";
part "async_utils.dart";
part "lang_feature_check.dart";

/**
 * Expect is used for tests that do not want to make use of the
 * Dart unit test library - for example, the core language tests.
 * Third parties are discouraged from using this, and should use
 * the expect() function in the unit test library instead for
 * test assertions.
 */

 void _fail(String message) {
    throw new ExpectException(message);
 }

