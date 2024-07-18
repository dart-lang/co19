// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that the identifier `augmented` occurs in a source
/// location where no enclosing declaration is augmenting. In this case, the
/// identifier is taken to be a reference to a declaration which is in scope.
///
/// @description Checks that if an identifier `augmented` occurs in a source
/// location where no enclosing declaration is augmenting then the identifier is
/// taken to be a reference to a declaration which is in scope. Test a setter
/// named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A08_t04_lib.dart';
import '../../Utils/expect.dart';

String _log = "";
void set augmented(String value) {
  _log = "augmented = $value";
}

class A {}

main() {
  topLevelFunction();
  Expect.equals("augmented = topLevelFunction", _log);
  C.staticMethod();
  Expect.equals("augmented = C.staticMethod", _log);
  C().instanceMethod();
  Expect.equals("augmented = C.instanceMethod", _log);
  M.staticMethod();
  Expect.equals("augmented = M.staticMethod", _log);
  MA().instanceMethod();
  Expect.equals("augmented = M.instanceMethod", _log);
  E.staticMethod();
  Expect.equals("augmented = E.staticMethod", _log);
  E.e1.instanceMethod();
  Expect.equals("augmented = E.instanceMethod", _log);
  Ext.staticMethod();
  Expect.equals("augmented = Ext.staticMethod", _log);
  A().instanceMethod();
  Expect.equals("augmented = Ext.instanceMethod", _log);
}
