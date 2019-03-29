/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The following names are allowed for user-defined operators:
 * <, >, <=, >=, ==, -, +, /, ˜/, *, %, |, ˆ, &, <<, >>, >>>, []=, [], ˜.
 * @description Checks that the listed operators may indeed be defined in a 
 * user class.
 * @author vasya
 */
// SharedOptions=--enable-experiment=triple-shift

import "../../../../Utils/expect.dart";

class C {
  int value;

  C(int i) {
    value = i;
  }

  operator +(C other) {
    return value + other.value;
  }

  operator -(C other) {
    return value - other.value;
  }

  operator /(C other) {
    return value / other.value;
  }

  operator *(C other) {
    return value * other.value;
  }

  operator %(C other) {
    return value % other.value;
  }

  operator ==(Object other) {
    if (other is C) {
      return value == other.value;
    }
    return false;
  }

  operator <(C other) {
    return value < other.value;
  }

  operator >(C other) {
    return value > other.value;
  }

  operator <=(C other) {
    return value <= other.value;
  }

  operator >=(C other) {
    return value >= other.value;
  }

  operator |(C other) {
    return value | other.value;
  }

  operator ^(C other) {
    return value ^ other.value;
  }

  operator &(C other) {
    return value & other.value;
  }

  operator <<(C other) {
    return value << other.value;
  }

  operator >>(C other) {
    return value >> other.value;
  }

  operator >>>(C other) {
    return value >>> other.value;
  }

  operator ~/(C other) {
    return value ~/ other.value;
  }

  operator [](int index) {
    return value + index;
  }

  operator []=(int index, int val) {
    value = val;
  }

  operator ~() {
    return ~value;
  }

  operator -() {
    return -value;
  }
}

main() {
  C c1 = new C(7);
  C c2 = new C(2);

  Expect.equals(9, c1 + c2);
  Expect.equals(5, c1 - c2);
  Expect.equals(3.5, c1 / c2);
  Expect.equals(3, c1 ~/ c2);
  Expect.equals(14, c1 * c2);
  Expect.equals(1, c1 % c2);
  Expect.isFalse(c1 == c2);
  Expect.isFalse(c1 < c2);
  Expect.isTrue(c1 > c2);
  Expect.isFalse(c1 <= c2);
  Expect.isTrue(c1 >= c2);
  Expect.equals(7, (c1 | c2));
  Expect.equals(5, (c1 ^ c2));
  Expect.equals(2, (c1 & c2));
  Expect.equals(28, (c1 << c2));
  Expect.equals(1, (c1 >> c2));
  Expect.equals(1, (c1 >>> c2));
  Expect.equals(~7, ~c1);
  Expect.equals(-2, -c2);
  Expect.equals(true, c1 == c1);
  Expect.equals(false, c1 == c2);

  c1[0] = 777;
  Expect.equals(777, c1[0]);

  c2[-100] = 99;
  Expect.equals(-1, c2[-100]);
}
