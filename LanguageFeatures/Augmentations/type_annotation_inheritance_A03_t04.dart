// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an abstract variable augments a
/// getter and setter that don't have a combined signature.
///
/// @description Checks that it's not an error if an abstract variable augments
/// a getter declaration and there is a setter with the same name in the
/// superinterface and they don't have a combined signature.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

abstract mixin class A {
  void set instanceVariable(String _);
}

abstract class C1 implements A {
  int get instanceVariable;
}

abstract class C2 extends A {
  int get instanceVariable;
}

abstract class C3 with A {
  int get instanceVariable;
}

augment abstract class C1 {
  augment abstract var instanceVariable;
}

augment abstract class C2 {
  augment abstract var instanceVariable;
}

augment abstract class C3 {
  augment abstract var instanceVariable;
}

class D1 extends C1 {
  String x = '';
  int get instanceVariable => 1;
  void set instanceVariable(String v) {
    x = v;
  }
}

class D2 extends C2 {
  String x = '';
  int get instanceVariable => 2;
  void set instanceVariable(String v) {
    x = v;
  }
}

class D3 extends C3 {
  String x = '';
  int get instanceVariable => 3;
  void set instanceVariable(String v) {
    x = v;
  }
}

main() {
  final d1 = D1();
  Expect.equals(1, d1.instanceVariable);
  d1.instanceVariable = '1';
  Expect.equals('1', d1.x);
  final d2 = D2();
  Expect.equals(2, d2.instanceVariable);
  d2.instanceVariable = '2';
  Expect.equals('2', d2.x);
  final d3 = D3();
  Expect.equals(3, d3.instanceVariable);
  d3.instanceVariable = '3';
  Expect.equals('3', d3.x);
}
