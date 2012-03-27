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
 */

main() {
  var i = new StringBuffer();
  i.add(1);
  {
    i.add(2);
    {
      i.add(3);
    }
    i.add(4);
    {
      i.add(5);
      {
        i.add(6);
      }
      i.add(7);
    }
    i.add(8);
    {
      i.add(9);
    }
    i.add(10);
  }
  i.add(11);
  Expect.equals("1234567891011", i.toString());
}

