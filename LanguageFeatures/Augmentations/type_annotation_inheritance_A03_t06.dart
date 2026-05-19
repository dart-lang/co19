// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an abstract variable augments a
/// getter and setter that don't have a combined signature.
///
/// @description Checks that it's not an error if an abstract variable augments
/// a setter declaration and there is a getter with the same name in the
/// superinterface and they don't have a combined signature. Test an extension
/// type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String log = '';

abstract class A1 {
  int get instanceVariable;
}

abstract class A2 {
  void set instanceVariable(String _);
}

extension type ET1(A1 v) implements A1 {
  void set instanceVariable(String v) {
    log = v;
  }
}

extension type ET2(A2 v) implements A2 {
  int get instanceVariable => 2;
}

augment extension type ET1 {
  augment abstract var instanceVariable;
}

augment extension type ET2 {
  augment abstract var instanceVariable;
}

class C1 extends A1 {
  int get instanceVariable => 1;
}
class C2 extends A2 {
  void set instanceVariable(String v) {
    log = v;
  }
}

main() {
  final et1 = ET1(C1());
  Expect.equals(1, et1.instanceVariable);
  et1.instanceVariable = '1';
  Expect.equals('1', log);
  final et2 = ET2(C2());
  Expect.equals(2, et2.instanceVariable);
  et2.instanceVariable = '2';
  Expect.equals('2', log);
}
