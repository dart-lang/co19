/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the declared type of a declaration d, as it appears in
 * the program source. The actual type of d is
 *  • [A1, . . . ,An/U1, . . . ,Un]T if d depends on type parameters U1,...,Un,
 *  and Ai is the value of Ui, 1  i  n.
 *  • T otherwise.
 * @description Checks that in case of arity mismatch (less type arguments than
 * expected) actual type is TT<dynamic, ..., dynamic>
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
import "../../../../Utils/expect.dart";

class C<T1, T2> {}

main() {
  C<int> c = new C<int>(); /// static type warning
  Expect.isTrue(c is C<dynamic, dynamic>);
}
