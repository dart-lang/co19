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
/// @description Checks that legacy code cannot import and call a non-function
/// type alias with generic function as type parameter or bound.
/// @author iarkh@unipro.ru

// @dart=2.9
// Requirements=nnbd-weak

import "opted_out_lib.dart";

main() {
  A5();
//^^
// [analyzer] unspecified
// [cfe] unspecified

  A6();
//^^
// [analyzer] unspecified
// [cfe] unspecified

  A7();
//^^
// [analyzer] unspecified
// [cfe] unspecified

  A8();
//^^
// [analyzer] unspecified
// [cfe] unspecified

  A5 c1 = throw "Error";
//^^
// [analyzer] unspecified
// [cfe] unspecified

  A6 c2 = throw "Error";
//^^
// [analyzer] unspecified
// [cfe] unspecified

  A7 c3 = throw "Error";
//^^
// [analyzer] unspecified
// [cfe] unspecified

  A8 c4 = throw "Error";
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
