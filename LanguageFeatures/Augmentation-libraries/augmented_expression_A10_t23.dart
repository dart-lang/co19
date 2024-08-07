// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error if a variable with the
/// name `augmented` occurs in a control-flow element in a location where there
/// is an enclosing augmenting declaration. Test top-level declarations.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A10_t23_lib.dart';

void topLevelFunction() {}
int get topLevelGetter => 0;
void set topLevelSetter(int _) {}
var topLevelVariable = () {};

main() {
  print(topLevelFunction);
  print(topLevelGetter);
  print(topLevelVariable);
  topLevelSetter = 0;
}
