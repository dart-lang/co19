/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Methods and fields (instance members) of a class or interface are declared
 * in the same scope known as the class scope. Static fields and methods (static members)
 * of a class are also declared in the class scope.
 * @description Checks that a class can not have a field and a static method with the same name.
 * @compile-error
 * @author msyabro
 */

class A {}
  int x;
  static void x() {}
}

void main() {}
