// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting with a getter: An augmenting getter can augment a
/// getter declaration, or the implicit getter of a variable declaration, with
/// all prior augmentations applied, by replacing the body of the augmented
/// getter with the body of the augmenting getter. Inside the augmenting
/// getter’s body, an `augmented` expression executes the augmented getter’s
/// body.
///
/// @description Checks that an augmenting getter can augment a getter
/// declaration with all prior augmentations applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_getters_A01_t02.dart';

augment String get topLevelVariable {
  return "Augment2: $augmented";
}

augment class C {
  augment static String get staticVariable {
    return "Augment2: $augmented";
  }
  augment String get instanceVariable {
    return "Augment2: $augmented";
  }
}

augment mixin M {
  augment static String get staticVariable {
    return "Augment2: $augmented";
  }
  augment String get instanceVariable {
    return "Augment2: $augmented";
  }
}

augment enum E {
  augment e0;
  augment static String get staticVariable {
    return "Augment2: $augmented";
  }
  augment String get instanceVariable {
    return "Augment2: $augmented";
  }
}

augment extension Ext {
  augment static String get staticVariable {
    return "Augment2: $augmented";
  }
}

augment extension type ET(String instanceVariable) {
  augment static String get staticVariable {
    return "Augment2: $augmented";
  }
  augment String get instanceVariable {
    return "Augment2: $augmented";
  }
}
