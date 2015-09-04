/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an instance variable is declared
 * to be constant.
 * @description Checks that It is a compile-time error if an instance variable
 * is declared to be constant.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class C {
  const v1 = 1;
}

main() {
  var x = new C().v1;
}
