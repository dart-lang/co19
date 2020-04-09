/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The modifier late is added as a built-in identifier.
 *
 * @description Check that legacy variable can be declared 'late'
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

class X {
  static late final A s1;
  static late A s2;

  late final A v1;
  late A v2;
}

late final A g1;
late A g2;

main() {
  late final A l1;
  late A l2;

  X.s1 = new A();
  X.s2 = new A();

  X x = new X();
  x.v1 = new A();
  x.v2 = new A();

  g1 = new A();
  g2 = new A();

  l1 = new A();
  l2 = new A();
}
