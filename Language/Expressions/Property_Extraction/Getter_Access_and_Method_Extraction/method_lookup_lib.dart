/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
library method_lookup;

class A {
  int m() => 0;
}
class C extends A {
   int m();
   int m1() => 1;
}
