/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A block statement supports sequencing of code.
 * Execution of a block statement { s1, ... , sn } proceeds as follows:
 * For i in 1..n; si is executed.
 * @description Checks that nested block statements are executed as expected.
 * @author iefremov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  var i = new StringBuffer();
  i.write(1);
  {
    i.write(2);
    {
      i.write(3);
    }
    i.write(4);
    {
      i.write(5);
      {
        i.write(6);
      }
      i.write(7);
    }
    i.write(8);
    {
      i.write(9);
    }
    i.write(10);
  }
  i.write(11);
  Expect.equals("1234567891011", i.toString());
}

