// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Inside the augmenting function’s body, a special `augmented(…)`
/// expression may be used to execute the augmented function body. That
/// expression takes an argument list matching the augmented function's
/// parameter list, and it has the same return type as the enclosing function.
///
/// @description Checks that inside an augmentation body of an instance method
/// `augmented()` expression executes the original method body. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_functions_A02_t07.dart';

augment class C {
  augment String instanceMethod1() {
    _log += augmented();
    _log += "augmented;";
    return "augment;";
  }

  augment String instanceMethod2(String v) {
    _log += augmented(v);
    _log += "augmented;";
    return "augment v=$v";
  }

  augment String instanceMethod3(String v1, [String v2 = "v2 def"]) {
    _log += augmented(v1, v2);
    _log += "augmented;";
    return "augment v1=$v1, [v2=$v2]";
  }

  augment String instanceMethod4(String v1, {String v2 = "v2 def"}) {
    _log += augmented(v1, v2: v2);
    _log += "augmented;";
    return "augment v1=$v1, {v2=$v2}";
  }
  
  augment String instanceMethod5(String v1, {required String v2}) {
    _log += augmented(v1, v2: v2);
    _log += "augmented;";
    return "augment v1=$v1, {required v2=$v2}";
  }

  augment String instanceMethod6(covariant String v) {
    _log += augmented(v);
    _log += "augmented;";
    return "augment covariant v=$v";
  }
}
