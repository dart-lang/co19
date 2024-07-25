// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting a getter and/or setter with a variable: This is a
/// compile-time error in all cases. Augmenting an abstract or external variable
/// with a variable is also a compile-time error, as those are actually just
/// syntax sugar for a getter and possibly a setter.
///
/// @description Checks that it is a compile-time error to augment a getter with
/// a variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_getters_setters_with_variable_A01_t01_lib.dart';

String get topLevelGetter => "Original";

class C {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

mixin M {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

enum E {
  e0;
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

class A {}

extension Ext on A {
  static String get staticGetter => "Original";
}

extension type ET(int _) {
  static String get staticGetter => "Original";
}

main() {
  print(topLevelGetter);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
