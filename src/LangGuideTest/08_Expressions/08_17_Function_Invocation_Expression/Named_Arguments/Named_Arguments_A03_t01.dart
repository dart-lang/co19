/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Positional arguments are always passed to the formal parameter in the same position.
 * @description Try to pass positional argument in different position
 * @compile-error
 * @author msyabro
 */


void func(int x, bool y) {}

void main() {
  func(true, 1);
}
