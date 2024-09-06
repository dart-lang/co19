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
/// @description Checks that within an augmenting getter `augmented` invokes the
/// original getter and evaluates to the return value. Test the case when a
/// getter is augmented more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A01_t07.dart';
import '../../Utils/expect.dart';

augment String get topLevelGetter {
  Expect.equals("Augmented1", augmented);
  return "Augmented2";
}

augment class C {
  augment static String get staticGetter {
    Expect.equals("Augmented1", augmented);
    return "Augmented2";
  }
  augment String get instanceGetter {
    Expect.equals("Augmented1", augmented);
    return "Augmented2";
  }
}

augment mixin M {
  augment static String get staticGetter {
    Expect.equals("Augmented1", augmented);
    return "Augmented2";
  }
  augment String get instanceGetter {
    Expect.equals("Augmented1", augmented);
    return "Augmented2";
  }
}

augment enum E {
  augment e1;

  augment static String get staticGetter {
    Expect.equals("Augmented1", augmented);
    return "Augmented2";
  }
  augment String get instanceGetter {
    Expect.equals("Augmented1", augmented);
    return "Augmented2";
  }
}

augment extension Ext {
  augment static String get staticGetter {
    Expect.equals("Augmented1", augmented);
    return "Augmented2";
  }
  augment String get instanceGetter {
    Expect.equals("Augmented1", augmented);
    return "Augmented2";
  }
}
