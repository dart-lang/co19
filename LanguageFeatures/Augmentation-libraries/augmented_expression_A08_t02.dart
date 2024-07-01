// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that the identifier augmented occurs such that the
/// outermost enclosing declaration is not an augmenting declaration. In this
/// case, the identifier is taken to be a reference to a declaration which is in
/// scope.
///
/// @description Checks that if an identifier `augmented` occurs such that the
/// outermost enclosing declaration is not an augmenting declaration then the
/// identifier is taken to be a reference to a declaration which is in scope.
/// Test a getter named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A08_t02_lib.dart';
import '../../Utils/expect.dart';

String get augmented => "augmented";

class A {}

main() {
  Expect.equals("augmented", topLevelFunction());
  Expect.equals("augmented", C.staticMethod());
  Expect.equals("augmented", C().instanceMethod());
  Expect.equals("augmented", M.staticMethod());
  Expect.equals("augmented", MA().instanceMethod());
  Expect.equals("augmented", E.staticMethod());
  Expect.equals("augmented", E.e1.instanceMethod());
  Expect.equals("augmented", Ext.staticMethod());
  Expect.equals("augmented", A().instanceMethod());
}
