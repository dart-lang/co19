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
/// @description Checks that it is not an error to invoke operator `+` on return
/// value of `augmented` expression if its return type has a `+` operator
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A01_t05_lib.dart';

const augmented = false;

String get topLevelGetter => "Original:";

class C {
  static String get staticGetter => "Original:";
  String get instanceGetter => "Original:";
  final bool augmented = false;
}

mixin M {
  static String get staticGetter => "Original:";
  String get instanceGetter => "Original:";
  static final bool augmented = false;
}

enum E {
  e1;

  static String get staticGetter => "Original:";
  String get instanceGetter => "Original:";
  static final bool augmented = false;
}

class A {}

extension Ext on A {
  static String get staticGetter => "Original:";
  String get instanceGetter => "Original:";
  static final bool augmented = false;
}

extension type ET(int _) {
  static String get staticGetter => "Original:";
  String get instanceGetter => "Original:";
  static final bool augmented = false;
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
  Expect.equals("Augmented", ET.staticGetter);
  Expect.equals("Augmented", ET(0).instanceGetter);
}
