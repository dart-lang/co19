/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, q is a factory constructor. Then:
 *   Let Ti be the type parameters of R (if any) and let Bi be the bound of
 * Ti, 1≤i≤ m. In checked mode, it is a dynamic type error if Vi is not a subtype
 * of [V1, ..., Vm /T1, ..., Tm ]Bi, i ∈ 1..m.
 * @description Checks that it is a dynamic-type error if a type argument is not
 * a subtype of type parameter bound of class R.
 * @author kaigorodov
 */

import "../../../Utils/dynamic_check.dart";

class R<T extends num> {
  factory R.fc() {
    return new C();
  }
}

class C<T extends num> implements R<T> {
   C() {}
}

main() {
  checkTypeError( () {
    new R<String>.fc();
  });
}
