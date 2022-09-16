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
/// @description Checks constructor tear-off expression for generic class.
/// @author iarkh@unipro.ru
/// @issue 46888

import "../../Utils/expect.dart";

class C<T> {
  C.constr(T t) {}
}

main() {
  Expect.isTrue(C.constr is C<X> Function<X extends dynamic>(X));
  Expect.isTrue(C<int>.constr is C<int> Function(int));
  Expect.runtimeIsType<C<X> Function<X extends dynamic>(X)>(C.constr);
  Expect.runtimeIsType<C<int> Function(int)>(C<int>.constr);
}
