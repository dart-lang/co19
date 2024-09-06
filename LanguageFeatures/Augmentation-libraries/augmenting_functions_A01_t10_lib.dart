// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code. The
/// augmentation replaces the original function body with the augmenting code.
///
/// @description Checks that an instance method may be augmented and the 
/// original code is replaced by the augmentation. Test an extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_functions_A01_t10.dart';

augment extension Ext {
  augment String instanceMethod1() {
    _log += "augment instanceMethod1();";
    return "augment";
  }

  augment String instanceMethod2(String v) {
    _log += "augment instanceMethod2($v);";
    return "augment v=$v";
  }

  augment String instanceMethod3(String v1, [String v2 = "v2 def"]) {
    _log += "augment instanceMethod3($v1, [$v2]);";
    return "augment v1=$v1, [v2=$v2]";
  }

  augment String instanceMethod4(String v1, {String v2 = "v2 def"}) {
    _log += "augment instanceMethod4($v1, {$v2});";
    return "augment v1=$v1, {v2=$v2}";
  }

  augment String instanceMethod5(String v1, {required String v2}) {
    _log += "augment instanceMethod5($v1, {required $v2});";
    return "augment v1=$v1, {required v2=$v2}";
  }
}
