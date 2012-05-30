/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the implicit interface of a non-abstract class C
 * includes an instance member m and C does not declare or inherit a corresponding instance member m.
 * @description Checks that it is a static warning if a class does not declare an instance method
 * declared in class' interface.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */

interface I {
  foo();
}

class C implements I {
}

main () {
  new C();
}
