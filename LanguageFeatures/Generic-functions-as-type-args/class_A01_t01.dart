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
/// @description Checks that generic function can be a class type argument and
/// bound: test extends clause in the class declaration dynamically.
/// @Issue 45415
/// @author iarkh@unipro.ru


import "../../Utils/expect.dart";

typedef exp1 = T Function<T>(T);
typedef exp2 = void Function<T>();
typedef exp3 = T Function<T>();
typedef exp4 = void Function<T>(T);

class C1<X extends T Function<T>(T)> {
  C1() { Expect.equals(exp1, X); }
}

class C2<X extends void Function<T>()> {
  C2() { Expect.equals(exp2, X); }
}

class C3<X extends T Function<T>()> {
  C3() { Expect.equals(exp3, X); }
}

class C4<X extends void Function<T>(T)> {
  C4() { Expect.equals(exp4, X); }
}

main() {
  C1 c1 = C1();
  C1 c2 = C1<T Function<T>(T)>();

  C2 c3 = C2();
  C2 c4 = C2<void Function<int>()>();

  C3 c5 = C3();
  C3 c6 = C3<T Function<T>()>();

  C4 c7 = C4();
  C4 c8 = C4<void Function<T>(T)>();
}
