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
/// the augmented function with appropriate default values. Test the case when a
/// function is augmented more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A04_t32.dart';
import '../../Utils/expect.dart';

augment String topLevelFunction1([String value]) {
  Expect.equals("default", value);
  Expect.equals("Augmented 1", augmented());
  return "Augmented 2";
}

augment String topLevelFunction2({String value}) {
  Expect.equals("default", value);
  Expect.equals("Augmented 1", augmented());
  return "Augmented 2";
}

augment class C {
  augment static String staticMethod1([String value]) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment static String staticMethod2({String value}) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment String instanceMethod1([String value]) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment String instanceMethod2({String value}) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
}

augment mixin M {
  augment static String staticMethod1([String value]) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment static String staticMethod2({String value}) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment String instanceMethod1([String value]) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment String instanceMethod2({String value}) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
}

augment enum E {
  augment e1;

  augment static String staticMethod1([String value]) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment static String staticMethod2({String value}) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment String instanceMethod1([String value]) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment String instanceMethod2({String value}) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
}

augment extension Ext {
  augment static String staticMethod1([String value]) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment static String staticMethod2({String value}) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment String instanceMethod1([String value]) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
  augment String instanceMethod2({String value}) {
    Expect.equals("default", value);
    Expect.equals("Augmented 1", augmented());
    return "Augmented 2";
  }
}
