// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// - Augmenting getters: Within an augmenting getter `augmented` invokes the
///   getter and evaluates to the return value. If augmenting a field with a
///   getter, this will invoke the implicit getter from the augmented field.
///
/// @description Checks that within an augmenting getter `augmented` invokes the
/// original getter and evaluates to the return value. Test the case when a
/// getter is augmented more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A01_t07_lib1.dart';
import augment 'augmented_expression_A01_t07_lib2.dart';
import '../../Utils/expect.dart';

String get augmented => "Getter augmented";

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
  e1;

  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

class A {}

extension Ext on A {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented2", topLevelGetter);
  Expect.equals("Augmented2", C.staticGetter);
  Expect.equals("Augmented2", C().instanceGetter);
  Expect.equals("Augmented2", M.staticGetter);
  Expect.equals("Augmented2", MA().instanceGetter);
  Expect.equals("Augmented2", E.staticGetter);
  Expect.equals("Augmented2", E.e1.instanceGetter);
  Expect.equals("Augmented2", Ext.staticGetter);
  Expect.equals("Augmented2", A().instanceGetter);
}
