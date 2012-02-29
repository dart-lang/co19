/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning to instantiate an abstract class.
 * @description Checks that it is a static warning to instantiate an abstract class
 * using a constant object expression in the enclosing lexical scope.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */

class A {
  const A();
  abstract f();
}

main() {
  var o = const A();
}
