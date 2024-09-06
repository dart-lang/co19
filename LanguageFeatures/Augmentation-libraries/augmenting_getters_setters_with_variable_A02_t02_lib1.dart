// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a non-abstract, non-external variable is augmented by an
/// augmenting getter or setter, you can still augment the variable, as you are
/// only augmenting the initializer, metadata, or doc comments of the augmented
/// variable. This is not considered to be augmenting the augmenting getter or
/// setter, since those are not actually altered.
///
/// @description Checks that it is not an error to augment a variable by a
/// setter and than by a variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_getters_setters_with_variable_A02_t02.dart';

augment void set topLevelVariable(String v) {}

augment class C {
  augment static void set staticVariable(String v) {}
  augment void set instanceVariable(String v) {}
}

augment mixin M {
  augment static void set staticVariable(String v) {}
  augment void set instanceVariable(String v) {}
}

augment enum E {
  augment e0;
  augment static void set staticVariable(String v) {}
}

augment extension Ext {
  augment static void set staticVariable(String v) {}
}

augment extension type ET {
  augment static void set staticVariable(String v) {}
}
