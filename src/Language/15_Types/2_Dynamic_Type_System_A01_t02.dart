/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In checked mode, it is a dynamic type error if a malbounded type
 * is used in a subtype test.
 * @description Checks that a dynamic type error occurs in checked mode when
 * malbounded type is used in a subtype test.
 * @static-warning
 * @author ilya
 */

import "../../Utils/dynamic_check.dart";

class C <T extends int> {}

main() {
  checkTypeError(() {
    int is C<double>;
  });
}

