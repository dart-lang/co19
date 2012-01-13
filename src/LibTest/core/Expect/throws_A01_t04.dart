/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void throws(void f(), [_CheckExceptionFn check = null, String reason = null])
 * typedef bool _CheckExceptionFn(exception)
 * Calls the function [f] and verifies that it throws an exception.
 * The optional [check] function can provide additional validation that the correct exception is being thrown.
 * @description Checks that the optional check function is called with the thrown object.
 * @author varlax
 * @reviewer msyabro
 */

//typedef bool checkFn(exception);
typedef void test();


main() {
  var err = null;
  test t = (){throw err;};

  Expect.throws(t, (e){Expect.isNull(e);return true;});
  
  err = "hello";
  Expect.throws(t, (e){return e === err;});

  err = new Object();
  Expect.throws(t, (e){return e === err;});
}
