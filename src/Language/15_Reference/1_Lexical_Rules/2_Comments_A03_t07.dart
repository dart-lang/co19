/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Documentation comments are multi-line comments that begin with the tokens '/''*''*'.
 * Inside a documentation comment, the Dart compiler ignores all text unless it is 
 * enclosed in brackets.
 * @description Checks that everything inside brackets is ignored.
 * @author hlodvig
 * @reviewer iefremov
 * @needsreview issue 2459
 */

main() {
  var x = 1;
 /**
  * Documentation comments [:throw 1; :]
  */
  Expect.equals(1, x);
}
