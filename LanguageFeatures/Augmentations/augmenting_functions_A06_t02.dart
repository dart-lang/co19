// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// - More than one declaration in the augmentation chain specifies a default
///   value for the same optional parameter. This is an error even in the case
///   where all of them are identical.
///
/// @description Checks that it is a compile-time error if more than one
/// declaration in the augmentation chain specifies a default value for the same
/// optional parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'augmenting_functions_A06_t02_lib.dart';

void topLevelFunction1([int v]) {}
void topLevelFunction2({int v}) {}

augment void topLevelFunction1([int v = 0]);
augment void topLevelFunction2({int v = 0});

class C {
  static void staticMethod1([int v]) {}
  static void staticMethod2({int v}) {}
  void instanceMethod1([int v]) {}
  void instanceMethod2({int v}) {}
}

augment class C {
  augment static void staticMethod1([int v = 0]);
  augment static void staticMethod2({int v = 0});
  augment void instanceMethod1([int v = 0]);
  augment void instanceMethod2({int v = 0});
}

mixin M {
  static void staticMethod1([int v]) {}
  static void staticMethod2({int v}) {}
  void instanceMethod1([int v]) {}
  void instanceMethod2({int v}) {}
}

augment mixin M {
  augment static void staticMethod1([int v = 0]);
  augment static void staticMethod2({int v = 0});
  augment void instanceMethod1([int v = 0]);
  augment void instanceMethod2({int v = 0});
}

enum E {
  e1;
  static void staticMethod1([int v]) {}
  static void staticMethod2({int v}) {}
  void instanceMethod1([int v]) {}
  void instanceMethod2({int v}) {}
}

augment enum E {
  ;
  augment static void staticMethod1([int v = 0]);
  augment static void staticMethod2({int v = 0});
  augment void instanceMethod1([int v = 0]);
  augment void instanceMethod2({int v = 0});
}

class A {}

extension Ext on A {
  static void staticMethod1([int v]) {}
  static void staticMethod2({int v}) {}
  void instanceMethod1([int v]) {}
  void instanceMethod2({int v}) {}
}

augment extension Ext {
  augment static void staticMethod1([int v = 0]);
  augment static void staticMethod2({int v = 0});
  augment void instanceMethod1([int v = 0]);
  augment void instanceMethod2({int v = 0});
}

extension type ET(int _) {
  static void staticMethod1([int v]) {}
  static void staticMethod2({int v}) {}
  void instanceMethod1([int v]) {}
  void instanceMethod2({int v}) {}
}

augment extension type ET {
  augment static void staticMethod1([int v = 0]);
  augment static void staticMethod2({int v = 0});
  augment void instanceMethod1([int v = 0]);
  augment void instanceMethod2({int v = 0});
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
