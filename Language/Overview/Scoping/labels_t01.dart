/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Labels are not included in the induced namespace of a scope; 
 * instead they have their own dedicated namespace.
 * @description Checks that labels and variables do not hide each other and no 
 * warnings are produced.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  var v = 54;
  {
    v: 1 + 1;
    Expect.equals(54, v);
    {
      l: 1 + 1;
      var l = 45;
      Expect.equals(45, l);
    }
  }
}
