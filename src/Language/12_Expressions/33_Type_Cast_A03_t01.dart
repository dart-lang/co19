/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is malformed the cast always succeeds.
 * This is a consequence of the rule that malformed types are treated as dynamic
 * @description Checks that if T is a parameterized type 
 * of the form G < T1, ..., Tn > and G is not a generic type, then T is malformed
 * and the cast always succeds.
 * @static-warning
 * @author rodionov 
 * @reviewer iefremov
 */

main() {
  var x = 1 as Unknown<int, bool>;
}
