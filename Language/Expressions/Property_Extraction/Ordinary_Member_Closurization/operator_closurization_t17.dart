/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let o be an object, and let u be a fresh final variable bound
 * to o. The closurization of method f on object o is defined to be equivalent
 * to:
 * • (a){return u op a;} if f is named op and op is one of <, >, <=, >=, ==,
 * -, +, /,  ̃/, *, %, |, ˆ, &, <<, >> (this precludes closurization of unary
 * -).
 *
 * @description Check that unary- cannot be closurised
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  int value;
  int operator -() {
    return -value;
  }
}

main() {
  C o = new C();
  o.value = 1;

  Expect.throws(() {var f = o#-;}, (e) => e is NoSuchMethodError);
}
