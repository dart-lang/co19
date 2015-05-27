/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let Ti be the static type of ai, let Si be the type of pi, i from 1 to h + k and let
 * Sq be the type of the named parameter q of f. It is a static warning if m < h or if m > n.
 * @description Checks that it is a static warning if the number of argument is more than number
 * of positional parameters of a function literal.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  try {
    (p1, p2, [p3]) {} (1, 2, 3, 4); /// static type warning
  } catch(e) {}
}
