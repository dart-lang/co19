/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static warning if an abstract member is declared or
 * inherited in a concrete class.
 * @description Checks that it is a static warning if an abstract method is
 * declared in a concrete class.
 * @author kaigorodov
 * @reviewer rodionov
 */

class A { /// static type warning
  foo([x]);
}

class B extends A {
  foo([x]){}
}

main() {
  var a=new B();
}
