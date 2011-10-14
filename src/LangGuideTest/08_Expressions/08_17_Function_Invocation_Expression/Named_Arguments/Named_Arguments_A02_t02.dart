/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Regular positional arguments must precede any named arguments.
 * @description Try to pass named arguments between regular positional arguments
 * @compile-error
 * @author msyabro
 * @needsreview check with exceptions 
 */


void func(int p1, int p2, [int np]) {}

main() {
  func(1, np:1, 1);
}
