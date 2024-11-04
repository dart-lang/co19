// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that the identifier `augmented` occurs in a source
/// location where no enclosing declaration is augmenting. In this case, the
/// identifier is taken to be a reference to a declaration which is in scope.
///
/// @description Checks that if an identifier `augmented` occurs in a source
/// location where no enclosing declaration is augmenting then the identifier is
/// taken to be a reference to a declaration which is in scope. Test a function
/// named `augmented()`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A08_t01_lib.dart';

String augmented() => "augmented";

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
  Expect.equals("augmented", ET.staticMethod());
  Expect.equals("augmented", ET(0).instanceMethod());
}
