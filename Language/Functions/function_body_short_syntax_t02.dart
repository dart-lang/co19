/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function body of the form => e is equivalent to a body of
 * the form {return e;} or the form async => e which is equivalent to a body
 * of the form async {return e;}.
 *
 * @description Checks that the function body of the form async => e is
 * equivalent to a body of the form async {return e;}.
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../Utils/expect.dart';

Future foo1() async => 1;

Future foo2() async {
  return 1;
}

Future bar1(int val) async => val * 2;

Future bar2(int val) async {
  return val * 2;
}

test() async {
  List r = await Future.wait([foo1(), foo2(), bar1(5), bar2(5)]);
  Expect.equals(r[0], r[1]);
  Expect.equals(r[2], r[3]);
}

main() {
  asyncStart();
  test().then((_) {
    asyncEnd();
  });
}
