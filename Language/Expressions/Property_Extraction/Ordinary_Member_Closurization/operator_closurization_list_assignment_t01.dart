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
 * • (a, b){return u[a] = b;} if f is named []=
 *
 * @description Check that closurization of operator []= on object o is
 * equivalent of (a, b) {return u[a] = b;}
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  var values = [1, 2, 3];
  void operator []= (var a, b) {
    return values[a] = b;
  }
}

main() {
  C o = new C();
  var f = o#[]=;

  var f1 = (a, b) {return o[a] = b;};

  f(0, 10);
  Expect.equals(10, o.values[0]);
  o.values[0] = 1;
  f1(0, 10);
  Expect.equals(10, o.values[0]);

  f(1, 20);
  Expect.equals(20, o.values[1]);
  o.values[1] = 2;
  f1(1, 20);
  Expect.equals(20, o.values[1]);

  f(2, 30);
  Expect.equals(30, o.values[2]);
  o.values[2] = 3;
  f1(2, 30);
  Expect.equals(30, o.values[2]);
}
