/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an integer literal is int.
 * @description Checks that no static warnings are produced when assigning an
 * integer literal to a typed int variable.
 * @static-clean
 * @author iefremov
 */

main() {
  int i = 0;
  i = 1;
  i = 2137483647;
  i = 2137483647;
  i = 9223372036854775807;
  i = 0xffffffffffffffff;
}
