/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a conditional ordinary method invocation e of the
 * form o?.m(a1, . . . , an, xn+1 : an+1, . . . , xn+k : an+k)
 * ...
 * The static type of e is the same as the static type of
 * o.m(a1, . . . , an, xn+1 :  an+1, . . . , xn+k : an+k).
 * @description Check that static type of the o?.m() is the same as o.m().
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

class C {
  int m ()=> 1;
}

main() {
  C c = new C();
  int x = c?.m();
}
