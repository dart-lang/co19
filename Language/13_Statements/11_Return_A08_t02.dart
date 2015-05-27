/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a function contains both one or more
 * return statements of the form return; and one or more return statements of
 * the form return e;.
 * @description Checks that it is a static warning if a function literal has
 * explicit return statements of different kind.
 * @static-warning
 * @author ilya
 */

main() {
  (x) {
    if (x)
      return 1;
    else
      return;
  } (true);
}
