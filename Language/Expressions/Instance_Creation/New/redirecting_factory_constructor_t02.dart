/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If q is a redirecting factory constructor of the form
 * T(p1, ..., pn+k ) = c; or of the form T.id(p1, ..., pn+k ) = c; then the
 * result of the evaluation of e is equivalent to evaluating the expression
 * [V1, ..., Vm/T1, ..., Tm ](new c(a1, ..., an, xn+1: an+1, ..., xn+k: an+k)).
 * @description Checks that it is a compile error if a type argument of a
 * redirecting factory constructor invocation is not a subtype of the
 * corresponding type parameter bound of class C.
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

import '../../../../Utils/dynamic_check.dart';

class R<T extends num> {
  factory R.fc() = C<T>;
}

class C<T extends num> implements R<T> {
   C() {}
}

main() {
  new R<String>.fc();
}
