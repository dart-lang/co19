/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of an if statement of the form if (b) s1 else s2
 * proceeds as follows:
 * . . .
 * If r is true, then the statement {s1} is executed, otherwise statement {s2}
 * is executed.
 * @description Checks that if and else branches statements are enclosed in
 * implicit extra blocks.
 * @author ilya
 */
import '../../../Utils/expect.dart';

main() {
  {
  var x = 1;

  if (true)
    var x = 2;

  Expect.equals(1,x);
  }

  {
  var x = 1;

  if (false)
    var x = 2;
  else
    var x = 3;

  Expect.equals(1,x);
  }

  {
  var x = 1;

  if (false)
    var x = 2;
  else
    Expect.equals(1, x);

  Expect.equals(1,x);
  }
}
