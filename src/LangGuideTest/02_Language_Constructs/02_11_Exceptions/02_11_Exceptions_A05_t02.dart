// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion Inside a catch clause, a caught exception can be re-thrown by issuing
 * a throw statement without any argument.
 * @description Checks that re-thrown exception will be captured.
 * @author pagolubev
 * @reviewer iefremov
 */


main() {
  try {
    try {
      throw 1;
    } catch(var e) {
      throw;
    }
  } catch(var e) {
    Expect.isTrue(e == 1);
  } 
}
