/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is no static warning if an instance method m1 overrides an
 * instance member m2 and m1 does not declare all the named parameters declared 
 * by m2.
 * @description Checks that there is no static warnings if m1 has the same
 * set of named parameters as m2 but in a different order.
 * @static-clean
 * @author iefremov
 */

class A {
  f({var x1, var x2, var y1, var y2}) { return '$x1$y2'; }
}

class C extends A {
  f({var x1, var x2, var y2, var y1}) { return '$x1$y2'; }
}

main() {
  new A().f(x1:"Nothing", x2:"endures", y1:"but", y2:"change");
  new C().f(x1:"Nothing", x2:"endures", y1:"but", y2:"change");
}
