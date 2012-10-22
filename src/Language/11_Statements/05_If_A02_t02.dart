/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion First, the expression b is evaluated to an object o.
 *  Then, o is subjected to boolean conversion, producing an object r.
 * @description Checks that it an AssertionError is thrown if the expression
 *  evaluates to null in checked mode.
 * @author kaigorodov
 */

main() {
  var i=null;
  try {
    if (i) {i = "hello";}
  } on AssertionError catch (e) {
  }
}
