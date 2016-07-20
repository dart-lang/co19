/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a top-level getter invocation i of the form m,
 * where m is an identifier, proceeds as follows:
 * The getter function m is invoked. The value of i is the result returned by
 * the call to the getter function.
 * @description Checks that the value of a top-level getter invocation
 * is the result returned by the call to the getter function.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

get a {
  return "v";
}

get b {
  return false;
}

get c {
  return 1;
}

main()  {
  Expect.equals("v", a);
  Expect.equals(false, b);
  Expect.equals(1, c);
}
