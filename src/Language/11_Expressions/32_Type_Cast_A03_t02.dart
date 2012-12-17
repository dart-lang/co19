/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a run-time error if T does not denote a type available in 
 * the current lexical scope. It is a static warning if T does not denote a type 
 * available in the current lexical scope.
 * @description Checks that it is a run-time error and a static warning if T 
 * does not denote a type available in the current lexical scope.
 * @author rodionov
 * @reviewer iefremov
 * @needsreview issue 9024
 */

main() {
  bool fail = false;
  try {
    1 as NonExistent<int>; /// static type warning
  } catch(ok) {
    fail = true;
  }
  Expect.isTrue(fail, "A runtime error is expected.");
}
