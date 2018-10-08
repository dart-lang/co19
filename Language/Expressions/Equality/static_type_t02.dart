/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an equality expression is bool.
 * @description Checks that static type of an equality expression is not int.
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

main() {
  int b = (1 == 1);
}
