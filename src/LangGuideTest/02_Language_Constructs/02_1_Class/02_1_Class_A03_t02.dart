/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Class may implement several interfaces.
 * @description Checks that class can extend a single class and implement several interfaces.
 * @author iefremov
 * @reviewer msyabro
 */

class A {}
interface I1{} interface I2{} interface I3{}
class B extends A implements I1, I2, I3{}


void main() {
}
