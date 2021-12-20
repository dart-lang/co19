// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Allow generic function types as type arguments and bounds
///
/// The language disallows generic function types as type arguments and bounds.
///
///  late List<T Function<T>(T)> idFunctions; // INVALID.
///  var callback = [foo<T>(T value) => value]; // Inferred as above, then invalid.
///  late S Function<S extends T Function<T>(T)>(S) f; // INVALID.
///
/// We remove that restriction, so a type argument and a bound can be a generic
/// function type.
///
/// This requires no new syntax, and in some cases only the removal of a single
/// check. There might be some platforms where the implementation currently
/// assumes that generic function types cannot occur as the value of type
/// variables (an proof-of-concept attempt hit an assert in the VM). Such
/// assumptions will need to be flushed out with tests and fixed.
///
/// Because we already infer List<T Function<T>(T)> in the code above, this
/// change will not affect type inference, it will just make the inferred type
/// not be an error afterwards.
///
/// We do not expect the removal of this restriction to affect the feasibility of
/// type inference. After all, it's already possible to have a generic function
/// type occurring covariantly in a type argument, like List<T Function<T>(T)
/// Function()>.
/// @description Checks that generic function can be a function type alias
/// argument and bound.
/// @Issue 45313
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

typedef T1<TT extends void Function<T>()> = TT Function();
typedef T2<TT extends void Function<T>()> = void Function(TT);
typedef T3<TT extends void Function<T>()> = TT Function(TT);
typedef T4<TT extends void Function<T>()> = void Function<TTT extends TT>();
typedef T5<TT extends void Function<T>()> = TTT Function<TTT extends TT>(TTT);
typedef T6<TT extends void Function<T>()> = void Function();

T testme<T extends void Function<P>()>(T t) => throw "Should not reach here!";

main() {
  T5 t = testme;

  Expect.isFalse(testme is T1);
  Expect.isFalse(testme is T2);
  Expect.isFalse(testme is T3);
  Expect.isFalse(testme is T4);
  Expect.isTrue(testme is T5);
  Expect.isFalse(testme is T6);
  checkType(checkIs<T1>, false, testme);
  checkType(checkIs<T2>, false, testme);
  checkType(checkIs<T3>, false, testme);
  checkType(checkIs<T4>, false, testme);
  checkType(checkIs<T5>, true, testme);
  checkType(checkIs<T6>, false, testme);
}
