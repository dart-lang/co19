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
/// augmented getter and evaluates it to the return value. Test a case when
/// `augmented` is called more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A01_t26.dart';
import '../../Utils/expect.dart';

augment String get topLevelGetter {
  String local() => "1: ${augmented}, 2: " + augmented;
  return local();
}

augment class C {
  augment static String get staticGetter {
    String local() => "1: ${augmented}, 2: " + augmented;
    return local();
  }
  augment String get instanceGetter {
    String local() => "1: ${augmented}, 2: " + augmented;
    return local();
  }
}

augment mixin M {
  augment static String get staticGetter {
    String local() => "1: ${augmented}, 2: " + augmented;
    return local();
  }
  augment String get instanceGetter {
    String local() => "1: ${augmented}, 2: " + augmented;
    return local();
  }
}

augment enum E {
  augment e1;

  augment static String get staticGetter {
    String local() => "1: ${augmented}, 2: " + augmented;
    return local();
  }
  augment String get instanceGetter {
    String local() => "1: ${augmented}, 2: " + augmented;
    return local();
  }
}

augment extension Ext {
  augment static String get staticGetter {
    String local() => "1: ${augmented}, 2: " + augmented;
    return local();
  }
  augment String get instanceGetter {
    String local() => "1: ${augmented}, 2: " + augmented;
    return local();
  }
}
