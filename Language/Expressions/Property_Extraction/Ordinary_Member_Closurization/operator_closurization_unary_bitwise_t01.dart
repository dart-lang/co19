/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let o be an object, and let u be a fresh final variable bound
 * to o. The closurization of method f on object o is defined to be equivalent
 * to:
 * ...
 * • (){return  ̃ u;} if f is named  ̃.
 *
 * @description Check that closurization of operator ~ on object o is
 * equivalent to () {return ~u;}
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  int value;

  int operator ~() {
    return ~value;
  }
}

main() {
  C o = new C();
  var f = o#~;

  var f1 = () {return ~o;};

  o.value = 1;
  Expect.equals(f(), f1());
  o.value = 0;
  Expect.equals(f(), f1());
  o.value = -4;
  Expect.equals(f(), f1());
  o.value = 13;
  Expect.equals(f(), f1());
}
