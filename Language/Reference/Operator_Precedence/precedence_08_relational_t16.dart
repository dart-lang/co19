/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Relational        is                                 None           8
 * @description Test that 'is' relational operator has no associativity. It is
 * compile error to expect any associativity from it
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

main() {
  var a = 0;
  var b = a is num is bool;
}
