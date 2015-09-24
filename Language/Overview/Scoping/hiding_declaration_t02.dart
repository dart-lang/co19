/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a 
 * scope S, then d hides any declaration named n that is available in the 
 * lexically enclosing scope of S.
 * @description Checks that a name in the scope of a block statement can hide 
 * a name from a lexically enclosing scope and that does not produce a static 
 * warning.
 * @author msyabro
 * @reviewer iefremov
 */


main() {
  () {
    int x;
    {
      var x;
    }
  }();
}
