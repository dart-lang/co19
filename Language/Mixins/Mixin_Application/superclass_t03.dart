/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is no error to derive a mixin from a class which has a
 * superclass other than Object.
 * @description Checks that it is no error to derive a mixin from a class
 * which has a superclass other than Object. Test type aliases
 * @issue 26409
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../Utils/expect.dart";

class Sstatic {
  int get g1 => 1;
}

class M extends Sstatic {
  int get g2 => 2;
  int get g4 => super.g1;
}

class SuperA {
  int get g1 => -1;
  int get g3 => 3;
}

typedef AliasA = SuperA;
typedef AliasM = M;

class A = AliasA with AliasM;

main() {
  A a = new A();
  Expect.equals(-1, a.g1);
  Expect.equals(2, a.g2);
  Expect.equals(3, a.g3);
  Expect.equals(-1, a.g4);
}
