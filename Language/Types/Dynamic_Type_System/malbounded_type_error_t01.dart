/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error occurs when malbounded type is used
 * in a subtype test.
 * @description Checks that a compile error occurs when malbounded type is used
 * in a subtype test.
 * @compile-error
 * @author ilya
 */

class C <T extends int> {}

main() {
  int is C<double>;
}

