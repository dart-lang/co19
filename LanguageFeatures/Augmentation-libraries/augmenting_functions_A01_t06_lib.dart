// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code. The
/// augmentation replaces the original function body with the augmenting code.
///
/// @description Checks that a static method may be augmented and the original
/// code is replaced by the augmentation. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A01_t06.dart';

augment extension type ET(int id) {
  augment static String staticMethod1() {
    _log += "augment staticMethod1();";
    return "augment";
  }

  augment static String staticMethod2(String v) {
    _log += "augment staticMethod2($v);";
    return "augment v=$v";
  }

  augment static String staticMethod3(String v1, [String v2 = "v2 def"]) {
    _log += "augment staticMethod3($v1, [$v2]);";
    return "augment v1=$v1, [v2=$v2]";
  }

  augment static String staticMethod4(String v1, {String v2 = "v2 def"}) {
    _log += "augment staticMethod4($v1, {$v2});";
    return "augment v1=$v1, {v2=$v2}";
  }

  augment static String staticMethod5(String v1, {required String v2}) {
    _log += "augment staticMethod5($v1, {required $v2});";
    return "augment v1=$v1, {required v2=$v2}";
  }
}
