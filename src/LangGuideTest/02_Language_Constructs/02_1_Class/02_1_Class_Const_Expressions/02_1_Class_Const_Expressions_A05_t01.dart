/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constant expressions are specified by using const instead of new when calling 
 * the constructor. Constant constructors can also be used for creating objects at runtime. 
 * Simply use new with a constant constructor.
 * @description Checks using new with a constant constructor.
 * @author iefremov
 * @reviewer msyabro
 */

class C {
  const C();
}

void main() {
  final c = new C();
}
