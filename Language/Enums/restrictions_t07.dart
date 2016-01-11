/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is also a compile-time error to subclass, mix-in or implement 
 * an enum or to explicitly instantiate an enum.
 * @description Checks that it is compile-time error to implement an enum. Test
 * the case when class implements several interfaces 
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

enum E {a, b, c}

class M1 {
}

class M2 {
}

class C implements M1, E, M2 {
}

main() {
  new C();
}
