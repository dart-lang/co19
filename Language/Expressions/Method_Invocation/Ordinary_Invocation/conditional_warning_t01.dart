/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Exactly the same static warnings that would be caused
 * by o.m(a1, . . . , an, xn+1 : an+1, . . . , xn+k : an+k) are also generated
 * in the case of o?.m(a1, . . . , an, xn+1 : an+1, . . . , xn+k : an+k).
 * @description Check that if o.m() produces static type warning then o?.m()
 * produces the same warning as well
 * @static-warning
 * @author sgrekhov@unipro.ru
 */

class C {
  double m() => 1.0;
}

main() {
  C c = new C();
  int l = null;
  l = c?.m(); /// static type warning
}
