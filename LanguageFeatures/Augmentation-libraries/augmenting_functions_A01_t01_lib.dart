// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code. The
/// augmentation replaces the original function body with the augmenting code.
///
/// @description Checks that a top-level function may be augmented and the
/// original code is replaced by the augmentation
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_functions_A01_t01.dart';

augment String topLevelFunction1() {
  _log += "augment topLevelFunction1();";
  return "augment";
}

augment String topLevelFunction2(String v) {
  _log += "augment topLevelFunction2($v);";
  return "augment v=$v";
}

augment String topLevelFunction3(String v1, [String v2 = "v2 def"]) {
  _log += "augment topLevelFunction3($v1, [$v2]);";
  return "augment v1=$v1, [v2=$v2]";
}

augment String topLevelFunction4(String v1, {String v2 = "v2 def"}) {
  _log += "augment topLevelFunction4($v1, {$v2});";
  return "augment v1=$v1, {v2=$v2}";
}

augment String topLevelFunction5(String v1, {required String v2}) {
  _log += "augment topLevelFunction5($v1, {required $v2});";
  return "augment v1=$v1, {required v2=$v2}";
}
