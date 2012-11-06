/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if Tj may not be assigned to
 * Sq(j - m), j from m + 1 to m + l.
 * @description Checks that it is a static warning if the type of an actual argument may
 * not be assigned to the type of an optional parameter of a local function.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

import "../../../Utils/dynamic_check.dart";

main() {
  checkTypeError( () => ([int x]){}(''));
}
