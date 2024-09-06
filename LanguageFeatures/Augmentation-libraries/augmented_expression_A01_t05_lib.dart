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

part of 'augmented_expression_A01_t05.dart';
import '../../Utils/expect.dart';

augment String get topLevelGetter {
  Expect.equals("Original:a1", augmented + "a1");
  var f = () {
    return augmented + "a2";
  };
  Expect.equals("Original:a2", f());
  return "Augmented";
}

augment class C {
  augment static String get staticGetter {
    Expect.equals("Original:b1", augmented + "b1");
    var f = () {
      return augmented + "b2";
    };
    Expect.equals("Original:b2", f());
    return "Augmented";
  }
  augment String get instanceGetter {
    Expect.equals("Original:c1", augmented + "c1");
    var f = () {
      return augmented + "c2";
    };
    Expect.equals("Original:c2", f());
    return "Augmented";
  }
}

augment mixin M {
  augment static String get staticGetter {
    Expect.equals("Original:d1", augmented + "d1");
    var f = () {
      return augmented + "d2";
    };
    Expect.equals("Original:d2", f());
    return "Augmented";
  }
  augment String get instanceGetter {
    Expect.equals("Original:e1", augmented + "e1");
    var f = () {
      return augmented + "e2";
    };
    Expect.equals("Original:e2", f());
    return "Augmented";
  }
}

augment enum E {
  augment e1;

  augment static String get staticGetter {
    Expect.equals("Original:f1", augmented + "f1");
    var f = () {
      return augmented + "f2";
    };
    Expect.equals("Original:f2", f());
    return "Augmented";
  }
  augment String get instanceGetter {
    Expect.equals("Original:g1", augmented + "g1");
    var f = () {
      return augmented + "g2";
    };
    Expect.equals("Original:g2", f());
    return "Augmented";
  }
}

augment extension Ext {
  augment static String get staticGetter {
    Expect.equals("Original:h1", augmented + "h1");
    var f = () {
      return augmented + "h2";
    };
    Expect.equals("Original:h2", f());
    return "Augmented";
  }
  augment String get instanceGetter {
    Expect.equals("Original:i1", augmented + "i1");
    var f = () {
      return augmented + "i2";
    };
    Expect.equals("Original:i2", f());
    return "Augmented";
  }
}
