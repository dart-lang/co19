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

import '../../Utils/expect.dart';
part 'augmenting_getters_A01_t01_lib.dart';

String get topLevelGetter {
  return "Original";
}

augment String get topLevelGetter {
  return "Augment1: $augmented";
}

class C {
  static String get staticGetter {
    return "Original";
  }
  String get instanceGetter {
    return "Original";
  }
}

augment class C {
  augment static String get staticGetter {
    return "Augment1: $augmented";
  }
  augment String get instanceGetter {
    return "Augment1: $augmented";
  }
}

mixin M {
  static String get staticGetter {
    return "Original";
  }
  String get instanceGetter {
    return "Original";
  }
}

augment mixin M {
  augment static String get staticGetter {
    return "Augment1: $augmented";
  }
  augment String get instanceGetter {
    return "Augment1: $augmented";
  }
}

enum E {
  e0;
  static String get staticGetter {
    return "Original";
  }
  String get instanceGetter {
    return "Original";
  }
}

augment enum E {
  augment e0;
  augment static String get staticGetter {
    return "Augment1: $augmented";
  }
  augment String get instanceGetter {
    return "Augment1: $augmented";
  }
}

class A {}

extension Ext on A {
  static String get staticGetter {
    return "Original";
  }
  String get instanceGetter {
    return "Original";
  }
}

augment extension Ext {
  augment static String get staticGetter {
    return "Augment1: $augmented";
  }
  augment String get instanceGetter {
    return "Augment1: $augmented";
  }
}

extension type ET(int _) {
  static String get staticGetter {
    return "Original";
  }
  String get instanceGetter {
    return "Original";
  }
}

augment extension type ET {
  augment static String get staticGetter {
    return "Augment1: $augmented";
  }
  augment String get instanceGetter {
    return "Augment1: $augmented";
  }
}

class MA = Object with M;

main() {
  Expect.equals("Augment2: Augment1: Original", topLevelGetter);
  Expect.equals("Augment2: Augment1: Original", C.staticGetter);
  Expect.equals("Augment2: Augment1: Original", C().instanceGetter);
  Expect.equals("Augment2: Augment1: Original", M.staticGetter);
  Expect.equals("Augment2: Augment1: Original", MA().instanceGetter);
  Expect.equals("Augment2: Augment1: Original", E.staticGetter);
  Expect.equals("Augment2: Augment1: Original", E.e0.instanceGetter);
  Expect.equals("Augment2: Augment1: Original", Ext.staticGetter);
  Expect.equals("Augment2: Augment1: Original", A().instanceGetter);
  Expect.equals("Augment2: Augment1: Original", ET.staticGetter);
  Expect.equals("Augment2: Augment1: Original", ET(0).instanceGetter);
}
