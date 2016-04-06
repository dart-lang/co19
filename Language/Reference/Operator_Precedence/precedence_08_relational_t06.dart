/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Relational        >                                 None           8
 * @description Test that '>' relational operator has no associativity. It is
 * compile error to expect any associativity from it. Test not overloaded
 * operator
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

main() {
  var v = 1 > 2 > 3;
}
