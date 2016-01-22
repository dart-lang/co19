/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of e. It is a static type warning if
 * T does not have an accessible instance method or getter named m unless
 * either:
 * • T or a superinterface of T is annotated with an annotation denoting a
 *   constant identical to the constant @proxy defined in dart:core. Or
 * • T is Type, e is a constant type literal and the class corresponding to e
 *   declares an accessible static method or getter named m.
 * • T is Function and m is call.
 * @description Check that it is no static type warning if object is a constant
 * type literal and corresponding class declares an accessible static method
 * named m
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  static int m() => 1;
}

main() {
  var f = C#m; /// no static type warning
  Expect.isTrue(f is Function);
}
