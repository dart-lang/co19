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
/// augmented implicit getter and evaluates it to the return value.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A01_t02_lib.dart';
import '../../Utils/expect.dart';

String get augmented => "Getter augmented";

String topLevelVariable = "Original";

class C {
  static String staticField = "Original";
  String instanceField = "Original";
}

mixin M {
  static String staticField = "Original";
  String instanceField = "Original";
}

enum E {
  e1;

  static String staticField = "Original";
  final String instanceField = "Original";
}

class A {}

extension Ext on A {
  static String staticField = "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented", topLevelVariable);
  Expect.equals("Augmented", C.staticField);
  Expect.equals("Augmented", C().instanceField);
  Expect.equals("Augmented", M.staticField);
  Expect.equals("Augmented", MA().instanceField);
  Expect.equals("Augmented", E.staticField);
  Expect.equals("Augmented", E.e1.instanceField);
  Expect.equals("Augmented", Ext.staticField);
}
