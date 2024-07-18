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
/// @description Checks that within an augmenting getter it is not an error to
/// call `augmented()` if an augmented getter return value is callable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A01_t09_lib.dart';
import '../../Utils/expect.dart';

class A {
  String id;
  A(this.id);
  String call() => "A($id).call";
}

String augmented() => "Global function, shouldn't be invoked";

A get topLevelGetter => A("topLevelGetter");

class C {
  static A get staticGetter => A("C.staticGetter");
  A get instanceGetter => A("C.instanceGetter");
  static String augmented() => "C.augmented(), shouldn't be invoked";
}

mixin M {
  static A get staticGetter => A("M.staticGetter");
  A get instanceGetter => A("M.instanceGetter");
  static String augmented() => "M.augmented(), shouldn't be invoked";
}

enum E {
  e1;

  static A get staticGetter => A("E.staticGetter");
  A get instanceGetter => A("E.instanceGetter");
  static String augmented() => "E.augmented(), shouldn't be invoked";
}

class D {}

extension Ext on D {
  static A get staticGetter => A("Ext.staticGetter");
  A get instanceGetter => A("Ext.instanceGetter");
  static String augmented() => "Ext.augmented(), shouldn't be invoked";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented", topLevelGetter.id);
  Expect.equals("Augmented", C.staticGetter.id);
  Expect.equals("Augmented", C().instanceGetter.id);
  Expect.equals("Augmented", M.staticGetter.id);
  Expect.equals("Augmented", MA().instanceGetter.id);
  Expect.equals("Augmented", E.staticGetter.id);
  Expect.equals("Augmented", E.e1.instanceGetter.id);
  Expect.equals("Augmented", Ext.staticGetter.id);
  Expect.equals("Augmented", D().instanceGetter.id);
}
