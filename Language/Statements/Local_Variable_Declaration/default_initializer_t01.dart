/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement of the form var v; is equivalent
 * to var v = null;. A variable declaration statement of the form T v; is
 * equivalent to T v = null;.
 * @description Checks that a variable declaration statements of the form var id;
 * and T id; are equivalent to a variable declaration of the form T id = null,
 * regardless of the type T.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

class C {}
abstract class I { }
typedef f();

main() {
  var id;
  Expect.equals(null, id);

  bool id0;
  Expect.equals(null, id0);

  int id1;
  Expect.equals(null, id1);

  double d;
  Expect.equals(null, d);

  String id2;
  Expect.equals(null, id2);

  Object id3;
  Expect.equals(null, id3);

  C id4;
  Expect.equals(null, id4);

  I id5;
  Expect.equals(null, id5);

  List<double> id6;
  Expect.equals(null, id6);

  Map<int, String> id7;
  Expect.equals(null, id7);

  f id8;
  Expect.equals(null, id8);
}

