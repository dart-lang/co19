// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library dynamic_check;
import 'expect.dart';

checkTypeError(f()) {
  Expect.throws(f, (e) => e is TypeError || e is CastError,
      "Type error should be thrown");
}

/// Check that dynamic error occurs. Dart specification (3rd Edition/June 12015)
/// does not specify what is 'dynamic errors'
/// (see https://github.com/dart-lang/sdk/issues/24394 ). So, for now,
/// this is a stub that checks that [Error] is thrown
checkDynamicError(f()) {
  Expect.throws(f, (e) => e is Error, "Dynamic Error should be thrown");
}
