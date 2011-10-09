/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Named parameters of a function can be passed as regular positional arguments.
 * @description Check that named parameters can be passed as regular positional arguments
 * @author msyabro
 */


void func1(int p1, int p2, [int np1, int np2]) {}
void func2(int p1, int p2 = 1, [int np1, int np2]) {}

void main() {
  func1(1, 1, 1, 1);
  func2(1,1,1);
}
