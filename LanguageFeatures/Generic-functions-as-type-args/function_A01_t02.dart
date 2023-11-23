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
/// @description Checks statically that generic function can be a function type
/// argument and bound.
/// @author iarkh@unipro.ru


typedef exp1 = T Function<T extends num>(T);
typedef exp2 = void Function<T extends num>();
typedef exp3 = T Function<T extends num>();
typedef exp4 = void Function<T extends num>(T);

void func1<T extends T Function<T extends num>(T)>() {}

void func2<T extends void Function<T extends num>()>() {}

void func3<T extends T Function<T extends num>()>() {}

void func4<T extends void Function<T extends num>(T)>() {}

main() {
  func1<exp1>();

  func1<exp2>();
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  func1<exp3>();
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  func1<exp4>();
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}
