/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a logical boolean expression is bool.
 * @description Checks that the static type of a logical boolean
 * expression is bool.
 * @static-warning
 * @author kaigorodov
 * @reviewer msyabro
 */

main() {
  try {
    int b = (true || false);
  } on TypeError catch(e) {}
}
