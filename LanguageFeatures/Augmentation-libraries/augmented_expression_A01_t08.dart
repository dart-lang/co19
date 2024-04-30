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
/// augmented getter and evaluates it to the return value.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A01_t08_lib.dart';
import '../../Utils/expect.dart';

const augmented = "Const augmented, shouldn't be invoked";

String get topLevelGetter => "Original";

class C {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
  String get augmented => "C.augmented, shouldn't be invoked";
}

mixin M {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
  String get augmented => "M.augmented, shouldn't be invoked";
}

enum E {
  e1;

  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
  String get augmented => "E.augmented, shouldn't be invoked";
}

class A {
  String get augmented => "A.augmented, shouldn't be invoked";
}

extension Ext on A {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented", topLevelGetter);
  Expect.equals("Augmented", C.staticGetter);
  Expect.equals("Augmented", C().instanceGetter);
  Expect.equals("Augmented", M.staticGetter);
  Expect.equals("Augmented", MA().instanceGetter);
  Expect.equals("Augmented", E.staticGetter);
  Expect.equals("Augmented", E.e1.instanceGetter);
  Expect.equals("Augmented", Ext.staticGetter);
  Expect.equals("Augmented", A().instanceGetter);
}
