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
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

typedef T1<TT extends void Function<T>()> = TT Function();
typedef T2<TT extends void Function<T>()> = void Function(TT);
typedef T3<TT extends void Function<T>()> = TT Function(TT);
typedef T4<TT extends void Function<T>()> = void Function<TTT extends TT>();
typedef T5<TT extends void Function<T>()> = TTT Function<TTT extends TT>(TTT);
typedef T6<TT extends void Function<T>()> = void Function();

typedef exp1 = void Function<T>() Function();
typedef exp2 = void Function(void Function<T>());
typedef exp3 = void Function<T>() Function(void Function<T>());
typedef exp4 = void Function<T extends void Function<T>()>();
typedef exp5 = T Function<T extends void Function<T>()>(T);
typedef exp6 = void Function();

main() {
  Expect.equals(exp1, T1);
  Expect.equals(exp2, T2);
  Expect.equals(exp3, T3);
  Expect.equals(exp4, T4);
  Expect.equals(exp5, T5);
  Expect.equals(exp6, T6);
}
