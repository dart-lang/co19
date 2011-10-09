// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion An instance-field assignment is of the form lhs.identifier = rhs.
 * Where: 
 * identifier is a simple identifier.
 * lhs, and rhs are expressions.
 * @description Check that instanse/field assignment is a valid expression
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  var x;
  A() {}
}


void main() {
  A a = new A();
  a.x = 1;
}
