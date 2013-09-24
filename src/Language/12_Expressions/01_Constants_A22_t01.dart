/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  A literal symbol is a constant expression.
 * @description Checks that literal symbol can be assigned to a constant
 * variable.
 * @note TODO symbol literals are not yet implemented
 * @author ilya
 * @issue 12171
 */

const i1 = #foo;

main() {
  i1;
}
