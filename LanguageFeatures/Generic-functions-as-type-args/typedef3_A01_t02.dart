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
/// variables (a proof-of-concept attempt hit an assert in the VM). Such
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
/// @description Checks that generic function can be a non-function typedef type
/// argument and bound: test extends clause in the typedef declaration
/// dynamically.
/// @author iarkh@unipro.ru


import "../../Utils/expect.dart";

typedef exp1 = T Function<T>(T);
typedef exp2 = void Function<T>();
typedef exp3 = T Function<T>();
typedef exp4 = void Function<T>(T);

class C<T> {
  C(expected) { Expect.equals(expected, T); }
}

typedef C1<X extends exp1> = C<X>;
typedef C2<X extends exp2> = C<X>;
typedef C3<X extends exp3> = C<X>;
typedef C4<X extends exp4> = C<X>;

main() {
  C1 c1 = C1<exp1>(exp1);
  C2 c3 = C2<exp2>(exp2);
  C3 c5 = C3<exp3>(exp3);
  C4 c7 = C4<exp4>(exp4);
}
