// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// - Augmenting getters: Within an augmenting getter `augmented` invokes the
///   augmented getter and evaluates to its return value. If augmenting a
///   variable with a getter, this will invoke the implicitly induced getter
///   from the augmented variable declaration.
///
/// @description Checks that within an augmented getter `augmented` can be used
/// to invoke appropriate getter in the current scope.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A01_t06_lib.dart';

String get augmented => "Getter augmented";

String get topLevelGetter => "topLevelGetter: $augmented";

class C {
  static String get staticGetter => "C.staticGetter: $augmented";
  String get instanceGetter => "C.instanceGetter: $augmented";
}

mixin M {
  static String get staticGetter => "M.staticGetter: $augmented";
  String get instanceGetter => "M.instanceGetter: $augmented";
}

enum E {
  e1;

  static String get staticGetter => "E.staticGetter: $augmented";
  String get instanceGetter => "E.instanceGetter: $augmented";
}

class A {}

extension Ext on A {
  static String get staticGetter => "E.staticGetter: $augmented";
  String get instanceGetter => "E.instanceGetter: $augmented";
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
