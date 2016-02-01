/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
 *  constant identical to the constant @proxy defined in dart:core. Or
 *  • T is Type, e1 is a constant type literal and the class corresponding to e1
 *  has a static setter named v=.
 * @description Checks that there is no static warning if the class of e1 does
 * not have a setter named v but is annotated with @proxy.
 * @static-clean
 * @author kaigorodov
 */
import '../../../Utils/expect.dart';

@proxy
class C {
}

main() {
  Expect.throws(() {
    new C().v = 1;
  }, (e) => e is NoSuchMethodError);
}
