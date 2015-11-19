/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a boolean literal is bool.
 * @description Checks that no static warnings are produced when assigning a
 * boolean literal to a typed bool variable.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  bool t = true;
  bool f = false;
}
