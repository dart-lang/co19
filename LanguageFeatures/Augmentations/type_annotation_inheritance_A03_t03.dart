// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an abstract variable augments a
/// getter and setter that don't have a combined signature.
///
/// @description Checks that it's not an error if an abstract final variable
/// augments a getter and there is a setter with the same name but different
/// type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  static int get staticVariable => 42;
  static void set staticVariable(String v) {}

  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment class C {
  augment static abstract final staticVariable;
  augment abstract final instanceVariable;
}

mixin M {
  static int get staticVariable => 42;
  static void set staticVariable(String v) {}

  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment mixin M {
  augment static abstract final staticVariable;
  augment abstract final instanceVariable;
}

enum E {
  e0;
  static int get staticVariable => 42;
  static void set staticVariable(String v) {}

  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment enum E {
  ;
  augment static abstract final staticVariable;
  augment abstract final instanceVariable;
}

class A {}

extension Ext on A {
  static int get staticVariable => 42;
  static void set staticVariable(String v) {}

  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment extension Ext {
  augment static abstract final staticVariable;
  augment abstract final instanceVariable;
}

extension type ET(int v) {
  static int get staticVariable => 42;
  static void set staticVariable(String v) {}

  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment extension type ET {
  augment static abstract final staticVariable;
  augment abstract final instanceVariable;
}

class MA = Object with M;

main() {
  Expect.equals(42, C.staticVariable);
  Expect.equals(42, C().instanceVariable);
  Expect.equals(42, M.staticVariable);
  Expect.equals(42, MA().instanceVariable);
  Expect.equals(42, E.staticVariable);
  Expect.equals(42, E.e0.instanceVariable);
  Expect.equals(42, Ext.staticVariable);
  Expect.equals(42, A().instanceVariable);
  Expect.equals(42, ET.staticVariable);
  Expect.equals(42, ET(0).instanceVariable);
}
