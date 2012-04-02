/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a run-time error if T does not denote a
 * type available in the current lexical scope.
 * @description Checks that it is a run-time error if T does not denote a
 * type available in the current lexical scope.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov 
 */

main() {
  bool exception = true;
  try {
  	null is Undeclared;
  	exception = false;
 } catch (var e) {
 }

 if(!exception) {
   Expect.fail("Exception is expected");
 }
}
