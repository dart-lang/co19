/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Object()
 * Creates a new Object instance.
 * Object instances have no meaningful state, and are only useful through their
 * identity. An Object instance is equal to itself only.
 * @description Checks that a new Object instance is equal to itself only
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var o1 = new Object();
  var o2 = new Object();
  Expect.isFalse(o1 == o2);
  Expect.equals(o1, o1);

  const o3 = const Object();
  const o4 = const Object();
  print(o3 == o4);
  //Expect.isFalse(o3 == o4);
  Expect.equals(o3, o3);

  const c1 = const C(1);
  const c2 = const C(1);
  print(c1 == c2);
}

class C {
  final m;
  const C(this.m);
}