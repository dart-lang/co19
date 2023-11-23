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
/// @description Checks that generic function can be a bound for custom generic
/// class.
/// @author iarkh@unipro.ru


import "../../Utils/expect.dart";

typedef exp1 = T Function<T>(T);
typedef exp2 = void Function<T>();
typedef exp3 = T Function<T>();
typedef exp4 = void Function<T>(T);

typedef exp5 = int Function<int>(int);
typedef exp6 = void Function<int>();
typedef exp7 = int Function<int>();
typedef exp8 = void Function<int>(int);

class C<T> {
  C(expected) { Expect.equals(expected, T); }
}

main() {
  C c1 = C<T Function<T>(T)>(exp1);
  C c2 = C<void Function<T>()>(exp2);
  C c3 = C<T Function<T>()>(exp3);
  C c4 = C<void Function<T>(T)>(exp4);

  C c5 = C<int Function<int>(int)>(exp5);
  C c6 = C<void Function<int>()>(exp6);
  C c7 = C<int Function<int>()>(exp7);
  C c8 = C<void Function<int>(int)>(exp8);
}
