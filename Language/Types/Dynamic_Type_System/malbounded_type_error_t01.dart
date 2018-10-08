/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A Dart implementation must support execution in both production
 * mode and checked mode. Those dynamic checks specified as occurring
 * specifically in checked mode must be performed iff the code is executed in
 * checked mode.
 * In checked mode, it is a dynamic type error if a deferred, malformed or
 * malbounded type is used in a subtype test.
 * @description Checks that a compile error occurs in checked mode when
 * malbounded type is used in a subtype test.
 * @compile-error
 * @author ilya
 */

import "../../../Utils/dynamic_check.dart";

class C <T extends int> {}

main() {
  int is C<double>;
}

