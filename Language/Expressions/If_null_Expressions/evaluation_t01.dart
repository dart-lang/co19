/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an if-null expression e of the form e1 ??e2 is
 * equivalent to the evaluation of the expression ((x) => x == null?e2 : x)(e1).
 *
 * @description Check evaluation order
 *
 * @author a.semenov@unipro.ru
 */
import '../../../Utils/expect.dart';

int e1count = 0;
int e1(int r) {
  e1count++;
  return r;
}

int e2count = 0;
int e2(int r) {
  e2count++;
  return r;
}

int e3count = 0;
int e3(int r) {
  e3count++;
  return r;
}

void reset() {
  e1count = 0;
  e2count = 0;
  e3count = 0;
}

main() {
  // if e1 evaluates to not null value, e2 is not evaluated
  reset();
  var x = e1(1) ?? e2(null);
  Expect.equals(1, e1count);
  Expect.equals(0, e2count);

  // if e1 evaluates to null value, e2 is evaluated
  reset();
  x = e1(null) ?? e2(1);
  Expect.equals(1, e1count);
  Expect.equals(1, e2count);

  // if e1 evaluates to not null value, e2 and e3 are not evaluated
  reset();
  x = e1(1) ?? e2(2) ?? e3(3);
  Expect.equals(1, e1count);
  Expect.equals(0, e2count);
  Expect.equals(0, e3count);

  // if e1 evaluates to null value and e2 is evaluated to not null value,
  // e3 is not evaluated
  reset();
  x = e1(null) ?? e2(2) ?? e3(3);
  Expect.equals(1, e1count);
  Expect.equals(1, e2count);
  Expect.equals(0, e3count);

  // if e1 evaluates to null value and e2 is evaluated to null,
  // e3 is evaluated
  reset();
  x = e1(null) ?? e2(null) ?? e3(3);
  Expect.equals(1, e1count);
  Expect.equals(1, e2count);
  Expect.equals(1, e3count);
}
