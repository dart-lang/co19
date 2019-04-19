/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if the implicit interface of a class
 * C includes an instance member m of type F and C declares or inherits a
 * corresponding instance member m of type F' if F' is not a subtype of F.
 * @description Checks that it is a compile error if the type F'
 * of declared instance member m is not a subtype of F.
 * @compile-error
 * @author ilya
 */

abstract class I {
  foo(var x);
}

class C implements I { 
  foo() {}
}

main () {
  new C();
}
