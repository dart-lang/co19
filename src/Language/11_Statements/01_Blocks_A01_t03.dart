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
  var i = "1";
  {
    i += "2";
    {
      i += "3";
    }
    i += "4";
    {
      i += "5";
      {
        i += "6";
      }
      i += "7";
    }
    i += "8";
    {
      i += "9";
    }
    i += "10";
  }
  i += "11";
  Expect.equals("1234567891011", i);
}

