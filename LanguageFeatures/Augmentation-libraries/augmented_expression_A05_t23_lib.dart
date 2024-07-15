// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, augmented refers to the
///   augmented operator method, which must be immediately invoked using
///   function call syntax. For example when augmenting `operator +` you would
///   use `augmented(1)` to call the augmented operator, and when augmenting
///   `operator []=` you would use the `augmented(key, value)` syntax.
///
/// @description Checks that within an augmenting operator `augmented` invokes
/// the augmented one and evaluates it to the return value. Test a function
/// literal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A05_t23.dart';
import '../../Utils/expect.dart';

augment class C {
  augment void operator []=(int index, Object? value) {
    var f = () {
      augmented(index, value);
      Expect.equals("Original [$index]=$value", _log);
    };
    f();
    _log = "Augmented [$index]=$value";
  }
}

augment mixin M {
  augment void operator []=(int index, Object? value) {
    var f = () {
      augmented(index, value);
      Expect.equals("Original [$index]=$value", _log);
    };
    f();
    _log = "Augmented [$index]=$value";
  }
}

augment enum E {
  augment e1;
  augment void operator []=(int index, Object? value) {
    var f = () {
      augmented(index, value);
      Expect.equals("Original [$index]=$value", _log);
    };
    f();
    _log = "Augmented [$index]=$value";
  }
}

augment extension Ext {
  augment void operator []=(int index, Object? value) {
    var f = () {
      augmented(index, value);
      Expect.equals("Original [$index]=$value", _log);
    };
    f();
    _log = "Augmented [$index]=$value";
  }
}
