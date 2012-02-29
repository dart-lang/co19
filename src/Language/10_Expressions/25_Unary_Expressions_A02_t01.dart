/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The expression !e is equivalent to the expression e ? false : true.
 * @description Checks that expression !e is equivalent to the expression e ? false : true.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  bool v=true;
  Expect.equals(v ? false : true, !v);
  v=false;
  Expect.equals(v ? false : true, !v);
}