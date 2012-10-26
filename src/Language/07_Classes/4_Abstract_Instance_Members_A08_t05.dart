/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static warning if an abstract member is declared or
 * inherited in a concrete class.
 * @description Checks that it is a static warning if an abstract setter is
 * declared in a concrete class.
 * @static-warning
 * @author kaigorodov
 */

class A {
  set foo(int v);
}

main() {
  var a=new A();
}
