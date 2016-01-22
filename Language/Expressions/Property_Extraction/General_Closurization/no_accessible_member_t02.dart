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
 * @description Check that it is a static type warning if object instance has
 * no public method or getter
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';
import 'no_accessible_member_lib.dart';

main() {
  A o = new A();
  Expect.throws(() {o#_m; /// static type warning
    }, (e) => e is NoSuchMethodError);
  Expect.throws(() {o#_g; /// static type warning
    }, (e) => e is NoSuchMethodError);
}
