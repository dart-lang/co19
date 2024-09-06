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
/// @description Checks that an augmenting getter can augment a variable
/// declaration with all prior augmentations applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_getters_A01_t02_lib.dart';

String topLevelVariable = "Original";

augment String get topLevelVariable {
  return "Augment1: $augmented";
}

class C {
  static String staticVariable = "Original";
  String instanceVariable = "Original";
}

augment class C {
  augment static String get staticVariable {
    return "Augment1: $augmented";
  }
  augment String get instanceVariable {
    return "Augment1: $augmented";
  }
}

mixin M {
  static String staticVariable = "Original";
  String instanceVariable = "Original";
}

augment mixin M {
  augment static String get staticVariable {
    return "Augment1: $augmented";
  }
  augment String get instanceVariable {
    return "Augment1: $augmented";
  }
}

enum E {
  e0;
  static String staticVariable = "Original";
  final String instanceVariable = "Original";
}

augment enum E {
  augment e0;
  augment static String get staticVariable {
    return "Augment1: $augmented";
  }
  augment String get instanceVariable {
    return "Augment1: $augmented";
  }
}

class A {}

extension Ext on A {
  static String staticVariable = "Original";
}

augment extension Ext {
  augment static String get staticVariable {
    return "Augment1: $augmented";
  }
}

extension type ET(String _) {
  static String staticVariable = "Original";
}

augment extension type ET {
  augment static String get staticVariable {
    return "Augment1: $augmented";
  }
}

class MA = Object with M;

main() {
  Expect.equals("Augment2: Augment1: Original", topLevelVariable);
  Expect.equals("Augment2: Augment1: Original", C.staticVariable);
  Expect.equals("Augment2: Augment1: Original", C().instanceVariable);
  Expect.equals("Augment2: Augment1: Original", M.staticVariable);
  Expect.equals("Augment2: Augment1: Original", MA().instanceVariable);
  Expect.equals("Augment2: Augment1: Original", E.staticVariable);
  Expect.equals("Augment2: Augment1: Original", E.e0.instanceVariable);
  Expect.equals("Augment2: Augment1: Original", Ext.staticVariable);
  Expect.equals("Augment2: Augment1: Original", ET.staticVariable);
}
