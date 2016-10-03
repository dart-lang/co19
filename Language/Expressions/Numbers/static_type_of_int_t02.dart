/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an integer literal is int.
 * @description Checks that it is a compile error to assign an integer literal
 * to a typed bool variable.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  bool b = 1;
}
