/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form e.m proceeds
 * as follows: ...
 * Let T be the static type of e. It is a static type warning if T does not
 * have a method or getter named m unless either:
 * • T or a superinterface of T is annotated with an annotation denoting a
 *   constant identical to the constant @proxy defined in dart:core.
 * @description Check that it is no static type warning if object type is
 * annotated with the constant @proxy. Test object instance
 * @static-clean
 * @author sgrekhov@unipro.ru
 * @issue 30573
 */
import '../../../../Utils/expect.dart';

@proxy
class C {
}

main() {
  C c = new C();
  Expect.throws(() { c.m; });
}
