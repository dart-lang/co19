// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A named constructor tear-off expression of one of the forms above
/// evaluates to a function value which could be created by tearing off a
/// corresponding constructor function, which would be a static function defined
/// on the class denoted by [C], with a fresh name here represented by adding
/// [$tearoff]:
///
///   static C name$tearoff<typeParams>(params) => C<typeArgs>.name(args);
///
/// @description Checks constructor tear-off expression for non-generic class.
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  C.constr() {}
}

main() {
  Expect.isTrue(C.constr is C Function());
  Expect.runtimeIsType<C Function()>(C.constr);
}
