/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Const object fields may only be assigned in the constructor's initializer list.
 * @description Checks assignment of the final field in the body of constructor.
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */

class C {
  C() {v = null;}
  final v;
}

void main() {
  var c = new C();
}
