// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an abstract variable augments a
/// getter and setter that don't have a combined signature.
///
/// @description Checks that it's not an error if an abstract variable augments
/// a setter declaration and there is a getter with the same name in the
/// superinterface and they don't have a combined signature. Test a mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

abstract class A1 {
  int get instanceVariable;
}

abstract class A2 {
  void set instanceVariable(String _);
}

mixin M1 implements A1 {
  void set instanceVariable(String _);
}

mixin M2 implements A2 {
  int get instanceVariable;
}

augment mixin M1 {
  augment abstract var instanceVariable;
}

augment mixin M2 {
  augment abstract var instanceVariable;
}

class C1 with M1 {
  String x = '';
  int get instanceVariable => 1;
  void set instanceVariable(String v) {
    x = v;
  }
}

class C2 with M2 {
  String x = '';
  int get instanceVariable => 2;
  void set instanceVariable(String v) {
    x = v;
  }
}

main() {
  final c1 = C1();
  Expect.equals(1, c1.instanceVariable);
  c1.instanceVariable = '1';
  Expect.equals('1', c1.x);
  final c2 = C2();
  Expect.equals(2, c2.instanceVariable);
  c2.instanceVariable = '2';
  Expect.equals('2', c2.x);
}
