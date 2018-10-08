/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void identical(var expected, var actual, [String reason = null]) 
 * Checks whether the expected and actual values are identical.
 * @description Checks that no exception is thrown when the arguments are identical,
 *              regardless of reason (the last argument). Null, numeric, String and
 *              Object values are tested.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main()
{
  Expect.identical(null, null);
  Expect.identical(null, null, "");
  Expect.identical(null, null, "not empty");

  Expect.identical(double.nan, double.nan);
  Expect.identical(double.nan, double.nan, "");
  Expect.identical(double.nan, double.nan, "not empty");

  Expect.identical(1, 1);
  Expect.identical(1, 1, "");
  Expect.identical(1, 1, "not empty");

  Expect.identical("foo", "foo");
  Expect.identical("foo", "foo", "");
  Expect.identical("foo", "foo", "not empty");

  var foo = new Object();
  Expect.identical(foo, foo);
  Expect.identical(foo, foo, "");
  Expect.identical(foo, foo, "not empty");
}
