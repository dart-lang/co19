/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a built-in identifier is used as the name of
 * a user-defined variable, function or label,
 * with the exception of user defined operator named negate.
 * @description Checks that it is a static warning if a label
 * is named operator.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 * @needsreview issue 3228
 */

main() {
  operator: while(true) {
    break operator;
  }
}
