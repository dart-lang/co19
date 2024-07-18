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

augment library 'augmented_expression_A01_t09.dart';
import '../../Utils/expect.dart';

augment A get topLevelGetter {
  Expect.equals("A(topLevelGetter).call", augmented());
  var f = () {
    return augmented();
  };
  Expect.equals("A(topLevelGetter).call", f());
  return A("Augmented");
}

augment class C {
  augment static A get staticGetter {
    Expect.equals("A(C.staticGetter).call", augmented());
    var f = () {
      return augmented();
    };
    Expect.equals("A(C.staticGetter).call", f());
    return A("Augmented");
  }
  augment A get instanceGetter {
    Expect.equals("A(C.instanceGetter).call", augmented());
    var f = () {
      return augmented();
    };
    Expect.equals("A(C.instanceGetter).call", f());
    return A("Augmented");
  }
}

augment mixin M {
  augment static A get staticGetter {
    Expect.equals("A(M.staticGetter).call", augmented());
    var f = () {
      return augmented();
    };
    Expect.equals("A(M.staticGetter).call", f());
    return A("Augmented");
  }
  augment A get instanceGetter {
    Expect.equals("A(M.instanceGetter).call", augmented());
    var f = () {
      return augmented();
    };
    Expect.equals("A(M.instanceGetter).call", f());
    return A("Augmented");
  }
}

augment enum E {
  augment e1;

  augment static A get staticGetter {
    Expect.equals("A(E.staticGetter).call", augmented());
    var f = () {
      return augmented();
    };
    Expect.equals("A(E.staticGetter).call", f());
    return A("Augmented");
  }
  augment A get instanceGetter {
    Expect.equals("A(E.instanceGetter).call", augmented());
    var f = () {
      return augmented();
    };
    Expect.equals("A(E.instanceGetter).call", f());
    return A("Augmented");
  }
}

augment extension Ext {
  augment static A get staticGetter {
    Expect.equals("A(Ext.staticGetter).call", augmented());
    var f = () {
      return augmented();
    };
    Expect.equals("A(Ext.staticGetter).call", f());
    return A("Augmented");
  }
  augment A get instanceGetter {
    Expect.equals("A(Ext.instanceGetter).call", augmented());
    var f = () {
      return augmented();
    };
    Expect.equals("A(Ext.instanceGetter).call", f());
    return A("Augmented");
  }
}
