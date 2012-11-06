/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a string literal is String.
 * @description Checks that a static type warning occurs when assigning
 * a double-quoted string literal to an int variable.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

import "../../Utils/dynamic_check.dart";

main() {
  int i;
  checkTypeError( () => i = "string");
}
