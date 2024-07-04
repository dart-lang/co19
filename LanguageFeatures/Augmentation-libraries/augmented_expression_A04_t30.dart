// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: When augmenting a function, `augmented` refers to
///   the augmented function. Tear offs are not allowed, so this function must
///   immediately be invoked.
///
/// @description Checks that within an augmenting function `augmented()` invokes
/// the augmented function. Test a function literal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A04_t30_lib.dart';
import '../../Utils/expect.dart';

String augmented() => "Global augmented() function, shouldn't be invoked";

String topLevelFunction() => "Original";

class C {
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
  String augmented() => "C.augmented(), shouldn't be invoked";
}

mixin M {
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
  String augmented() => "M.augmented(), shouldn't be invoked";
}

enum E {
  e1;

  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
  String augmented() => "E.augmented(), shouldn't be invoked";
}

class A {
  String augmented() => "A.augmented(), shouldn't be invoked";
}

extension Ext on A {
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented: Original", topLevelFunction());
  Expect.equals("Augmented: Original", C.staticMethod());
  Expect.equals("Augmented: Original", C().instanceMethod());
  Expect.equals("Augmented: Original", M.staticMethod());
  Expect.equals("Augmented: Original", MA().instanceMethod());
  Expect.equals("Augmented: Original", E.staticMethod());
  Expect.equals("Augmented: Original", E.e1.instanceMethod());
  Expect.equals("Augmented: Original", Ext.staticMethod());
  Expect.equals("Augmented: Original", A().instanceMethod());
}
