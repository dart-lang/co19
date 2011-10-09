/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Class may implement several interfaces.
 * @description Checks that class may implement several interfaces.
 * @author iefremov
 * @reviewer msyabro
 */

interface I1 { }

interface I2 { }

interface I3 { }

class C implements I1, I2, I3 {
  C() {}
}


void main() {
  I1 i1 = new C();
  I2 i2 = new C();
  I3 i3 = new C();
}
