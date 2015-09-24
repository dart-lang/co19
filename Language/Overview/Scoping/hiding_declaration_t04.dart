/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a 
 * scope S, then d hides any declaration named n that is available in the 
 * lexically enclosing scope of S.
 * @description Checks that the innermost available name is used instead of 
 * all names from the enclosing scopes that it hides.
 * @author msyabro
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

main() {
  var x = 1;
  {
    var x = 0;
    Expect.equals(1, ++x);
    () {
      var x = 2;
      Expect.equals(3, ++x);
    }();
  }
  Expect.equals(1, x);
  () {
    var x = 42;
    Expect.equals(43, ++x);
    {
      var x = 100500;
      Expect.equals(100501, ++x);
    }
    Expect.equals(43, x);
  }();
}
