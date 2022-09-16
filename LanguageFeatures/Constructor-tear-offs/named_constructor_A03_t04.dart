// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If [C] is not generic, then [<typeParams>] and [<typeArgs>] are
/// omitted. Otherwise <typeParams> are exactly the same type parameters as
/// those of the class declaration of [C] (including bounds), and [<typeArgs>]
/// applies those type parameter variables directly as type arguments to [C].
///
/// @description Checks that for generic class <typeParams> are exactly the same
/// type parameters as those of the class declaration of [C] (including bounds),
/// and [<typeArgs>] applies those type parameter variables directly as type
/// arguments to [C] - test case with the different type parameter numbers.
/// @author iarkh@unipro.ru

class C<T1, T2 extends num, T3 extends String> {
  C.constr(exp1, exp2, exp3) {}
}

main() {
  C<dynamic>.constr;
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  C<dynamic, num>.constr;
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  C<String, num, dynamic>.constr;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}
