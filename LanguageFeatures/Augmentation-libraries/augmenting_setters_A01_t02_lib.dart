// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting with a setter: An augmenting setter can augment a
/// setter declaration, or the implicit setter of a variable declaration, with
/// all prior augmentations applied, by replacing the augmented setter’s body
/// with the augmenting setter’s body. Inside the augmenting setter’s body, an
/// `augmented = <expression>` assignment invokes the augmented setter with the
/// value of the expression.
///
/// @description Checks that an augmenting setter can augment a variable
/// declaration with all prior augmentations applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_setters_A01_t02.dart';

augment void set topLevelVariable(int v) {
  augmented = v + 1;
  _log += "Augment2 = $v;";
}

augment class C {
  augment static void set staticVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
  augment void set instanceVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

augment mixin M {
  augment static void set staticVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
  augment void set instanceVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

augment enum E {
  augment e0;
  augment static void set staticVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

augment extension Ext {
  augment static void set staticVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}

augment extension type ET {
  augment static void set staticVariable(int v) {
    augmented = v + 1;
    _log += "Augment1 = $v;";
  }
}
