/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart supports single-line comments // and multi-line comments as in Java.
 * @description checks that commented code is ignored
 * @author pagolubev
 * @reviewer iefremov
 */


main() {
  var x = 0;
  // x = 5;
  Expect.isTrue(x == 0);
  /* x = 1;
   x = 100500; */
  Expect.isTrue(x == 0);
  /*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
   * Abyr, Abyr, Abyrvalg!
   */
}
