// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The augmenting function does not have to pass the same arguments
/// to `augmented(…)` as were passed to it. It may invoke `augmented` once, more
/// than once, or not at all.
///
/// @description Checks that it's not an error if an augmenting function passes
/// different arguments to the `augmented()` expression and calls it more than
/// once. Test instance methods of an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A03_t11.dart';

augment extension type ET(int id) {
  augment String instanceMethod1() {
    _log += augmented();
    _log += "augmented;";
    augmented();
    return "augment;";
  }

  augment String instanceMethod2(String v) {
    _log += augmented("a");
    _log += "augmented;";
    augmented("b");
    return "augment v=$v";
  }

  augment String instanceMethod3(String v1, [String v2 = "v2 def"]) {
    _log += augmented("c", "d");
    _log += "augmented;";
    augmented("e", "f");
    return "augment v1=$v1, [v2=$v2]";
  }

  augment String instanceMethod4(String v1, {String v2 = "v2 def"}) {
    _log += augmented("g", v2: "h");
    _log += "augmented;";
    augmented("i", v2: "j");
    return "augment v1=$v1, {v2=$v2}";
  }

  augment String instanceMethod5(String v1, {required String v2}) {
    _log += augmented("k", v2: "l");
    _log += "augmented;";
    augmented("m", v2: "n");
    return "augment v1=$v1, {required v2=$v2}";
  }
}
