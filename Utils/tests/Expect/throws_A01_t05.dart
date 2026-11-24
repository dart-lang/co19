// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void throws(
///   void Function() func, [_CheckExceptionFn? check, String reason = ''])
/// typedef _CheckExceptionFn = bool Function(dynamic exception)
/// Calls the function [func] and verifies that it throws an exception.
/// The optional [check] function can provide additional validation that the
/// correct exception is being thrown.
///
/// @description Checks that exception thrown by the optional check function is
/// not caught.
/// @author varlax

import "../../../Utils/expect.dart";

main() {
  var err = 234;
  try {
    Expect.throws((){throw new Exception();}, (e) => throw err);
    Expect.fail("should not reach here");
  } on int catch(i) {
    Expect.identical(err, i);
  }
}
