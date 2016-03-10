/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The break statement consists of the reserved word break and an
 * optional label.
 * breakStatement:
 *   break identifier? ';'
 * ;
 * @description Checks that a break statement can reference its own label.
 * @author kaigorodov
 * @reviewer rodionov
 */


main() {
  try {
	L: break L;
  } catch (x) {}
}
