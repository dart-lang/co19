/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the declared type of a declaration d, as it appears in
 * the program source. The actual type of d is
 *  • [A1,...,An/U1,...,Un]T if d depends on type parameters U1,...,Un, and
 *    Ai is the value of Ui, 1 ≤ i ≤ n.
 *  • T otherwise.
 * @description Checks that if type T depends on type parameters U1,...,Un, then
 * its actual type is [A1,...,An/U1,...,Un]T
 * @author sgrekhov@unipro.ru
 */
import "../../../../Utils/expect.dart";

class C<T1, T2> {}

main() {
  C<int, String> c = new C<int, String>();
  Expect.isTrue(c is C<int, String>);
}
