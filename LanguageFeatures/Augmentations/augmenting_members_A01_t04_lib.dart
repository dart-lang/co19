// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An augmenting declaration uses `augmented` when the augmented
/// declaration has no concrete implementation. Note that all external
/// declarations are assumed to have an implementation provided by another
/// external source, and otherwise they will throw a runtime error when called.
///
/// @description Checks that it is a not an error if an augmenting
/// declaration uses `augmented` when the augmented declaration is an external
/// static.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_members_A01_t04.dart';
import '../../Utils/expect.dart';

String _log = "";

augment class C {
  augment static String externalMethod() {
    Expect.throws(() {augmented();});
    return "Augmented";
  }
  augment static String get externalGetter {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
  augment static void set externalSetter(String v) {
    Expect.throws(() {augmented = v;});
    _log = "externalSetter = $v";
  }
  augment static String get externalVariable {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
  augment static void set externalVariable(String v) {
    Expect.throws(() {augmented = v;});
    _log = "externalVariable = $v";
  }
  augment static String get externalFinalVariable {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
}

augment mixin M {
  augment static String externalMethod() {
    Expect.throws(() {augmented();});
    return "Augmented";
  }
  augment static String get externalGetter {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
  augment static void set externalSetter(String v) {
    Expect.throws(() {augmented = v;});
    _log = "externalSetter = $v";
  }
  augment static String get externalVariable {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
  augment static void set externalVariable(String v) {
    Expect.throws(() {augmented = v;});
    _log = "externalVariable = $v";
  }
  augment static String get externalFinalVariable {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
}

augment enum E {
  augment e0;
  augment static String externalMethod() {
    Expect.throws(() {augmented();});
    return "Augmented";
  }
  augment static String get externalGetter {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
  augment static void set externalSetter(String v) {
    Expect.throws(() {augmented = v;});
    _log = "externalSetter = $v";
  }
  augment static String get externalVariable {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
  augment static void set externalVariable(String v) {
    Expect.throws(() {augmented = v;});
    _log = "externalVariable = $v";
  }
  augment static String get externalFinalVariable {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
}

augment extension Ext {
  augment static String externalMethod() {
    Expect.throws(() {augmented();});
    return "Augmented";
  }
  augment static String get externalGetter {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
  augment static void set externalSetter(String v) {
    Expect.throws(() {augmented = v;});
    _log = "externalSetter = $v";
  }
  augment static String get externalVariable {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
  augment static void set externalVariable(String v) {
    Expect.throws(() {augmented = v;});
    _log = "externalVariable = $v";
  }
  augment static String get externalFinalVariable {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
}

augment extension type ET {
  augment static String externalMethod() {
    Expect.throws(() {augmented();});
    return "Augmented";
  }
  augment static String get externalGetter {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
  augment static void set externalSetter(String v) {
    Expect.throws(() {augmented = v;});
    _log = "externalSetter = $v";
  }
  augment static String get externalVariable {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
  augment static void set externalVariable(String v) {
    Expect.throws(() {augmented = v;});
    _log = "externalVariable = $v";
  }
  augment static String get externalFinalVariable {
    Expect.throws(() {augmented;});
    return "Augmented";
  }
}
