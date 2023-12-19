// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Types are specified using the following grammar rules.
/// ...
/// ⟨typeNotVoidNotFunction⟩ ::= ⟨typeName⟩ ⟨typeArguments⟩?
///   | (⟨typeIdentifier⟩ ’.’)? Function
///
/// @description Checks that type `Function` can be used with an import prefix
/// @author sgrekhov22@gmail.com

import "dart:core" as p;
import "../../../Utils/expect.dart";

p.int foo() => 42;

main() {
  p.Function f = foo;
  Expect.equals(42, f());
  p.Type t = p.Function;
  Expect.equals("Function", t.toString());
}
