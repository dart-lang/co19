// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void throws(
/// void f(), [_CheckExceptionFn check = null, String reason = ''])
/// typedef bool _CheckExceptionFn(exception)
/// Calls the function [f] and verifies that it throws an exception.
/// The optional [check] function can provide additional validation that the
/// correct exception is being thrown.
///
/// @description Checks that the optional check function is called with the
/// thrown object.
///
/// @author varlax

import "../../../Utils/expect.dart";

typedef void test();

main() {
  var err1 = 0;
  test t = () => throw err1;
  Expect.throws(t, (e) => identical(e, err1));
  
  var err2 = "hello";
  t = () => throw err2;
  Expect.throws(t, (e) => identical(e, err2));

  var err3 = new Object();
  Expect.throws(() { throw err3; }, (e) => identical(e, err3));
}
