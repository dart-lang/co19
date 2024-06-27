// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` must be
///   followed by the operator. For example when augmenting `+` you must do
///   `augmented + 1`, and when augmenting `[]` you must do `augmented[<arg>]`.
///   These constructs invoke the augmented operator, and are the only valid
///   uses of `augmented` in these contexts.
///
/// @description Checks that `augmented[i]` and `augmented[i]=v` inside of an
/// augmenting operator invokes an augmented operator with `i` and `v` as an
/// arguments.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A05_t14.dart';
import '../../Utils/expect.dart';

augment class C {
  augment String operator [](int index) {
    Expect.equals("C: Augment1[$index]", augmented[index]);
    return "C: Augment2[$index]";
  }
  augment void operator []=(int index, String value) {
    augmented[index] = value;
    Expect.equals("C: Augment1[$index]=$value", _log);
    _log = "C: Augment2[$index]=$value";
  }
}

augment mixin M {
  augment String operator [](int index) {
    Expect.equals("M: Augment1[$index]", augmented[index]);
    return "M: Augment2[$index]";
  }
  augment void operator []=(int index, String value) {
    augmented[index] = value;
    Expect.equals("M: Augment1[$index]=$value", _log);
    _log = "M: Augment2[$index]=$value";
  }
}

augment enum E {
  augment e1;
  augment String operator [](int index) {
    Expect.equals("E: Augment1[$index]", augmented[index]);
    return "E: Augment2[$index]";
  }
  augment void operator []=(int index, String value) {
    augmented[index] = value;
    Expect.equals("E: Augment1[$index]=$value", _log);
    _log = "E: Augment2[$index]=$value";
  }
}

augment extension Ext {
  augment String operator [](int index) {
    Expect.equals("Ext: Augment1[$index]", augmented[index]);
    return "Ext: Augment2[$index]";
  }
  augment void operator []=(int index, String value) {
    augmented[index] = value;
    Expect.equals("Ext: Augment1[$index]=$value", _log);
    _log = "Ext: Augment2[$index]=$value";
  }
}
