/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of anonymous constructor f of type T is defined
 * to be equivalent to:
 * ...
 * • (r1, . . . , rn , [p1 = d1, . . . , pk = dk]){
 * return new T (r1, . . . , rn , p1 , . . . , pk );
 * }
 * if f is an anonymous constructor that has required parameters r1, . . . , rn,
 * and optional positional parameters p1, ... , pk with defaults d1, ... , dk
 *
 * @description Check that closurization of anonymous constructor
 * that has required parameters r1, . . . , rn , and optional positional
 * parameters p1, . . . , pk with defaults d1, . . . , dk is equivalent to
 * (r1, . . . , rn ,  [p1 = d1, . . . , pk = dk]) {
 * return new T(r1, . . . , rn, p1 : p1, . . . , pk : pk );
 * }
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  double value;

  C(int r1, int r2, double r3, [p1 = 2, p2 = -3, p3 = -7]) {
    value = r1 * r2 * r3 * p1 * p2 * p3;
  }
}

main() {
  var f1 = new C#;

  var f2 = (int r1, int r2, double r3, [p1 = 2, p2 = -3, p3 = -7]) {
    return new C(r1, r2, r3, p1, p2, p3);
  };

  var o1 = f1(1, 2, 3, 4, 5, 6);
  var o2 = f2(1, 2, 3, 4, 5, 6);
  Expect.isTrue(o1 is C);
  Expect.isTrue(o2 is C);
  Expect.equals(o1.value, o2.value);

  o1 = f1(3, 2, 3, 6, -2);
  o2 = f2(3, 2, 3, 6, -2);
  Expect.isTrue(o1 is C);
  Expect.isTrue(o2 is C);
  Expect.equals(o1.value, o2.value);

  o1 = f1(3, 2, 3.14, -6);
  o2 = f2(3, 2, 3.14, -6);
  Expect.isTrue(o1 is C);
  Expect.isTrue(o2 is C);
  Expect.equals(o1.value, o2.value);

  o1 = f1(3, 2, 3);
  o2 = f2(3, 2, 3);
  Expect.isTrue(o1 is C);
  Expect.isTrue(o2 is C);
  Expect.equals(o1.value, o2.value);

  o1 = f1(3, 2, 3, 6);
  o2 = f2(3, 2, 3, -6);
  Expect.isTrue(o1 is C);
  Expect.isTrue(o2 is C);
  Expect.notEquals(o1.value, o2.value);
}
