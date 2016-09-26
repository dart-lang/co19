/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1.v = e2 proceeds as
 * follows:
 * ...
 * Let T be the static type of e1. It is a static type warning if T does not
 * have an accessible instance setter named v = unless either:
 *  • T or a superinterface of T is annotated with an annotation denoting a
 *    constant identical to the constant @proxy defined in dart:core. Or
 *  • T is Type, e1 is a constant type literal and the class corresponding to e1
 *    has a static setter named v =.
 * @description Checks that it is a compile error if e1 is a constant type
 * literal but does not have a setter named v
 * @compile-error
 * @author kaigorodov
 * @note issue #16233
 */

class C {
}

main() {
  C.v = 1;
}
