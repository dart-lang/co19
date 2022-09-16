// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If [C] is not generic, then [<typeParams>] and [<typeArgs>] are
/// omitted. Otherwise <typeParams> are exactly the same type parameters as
/// those of the class declaration of [C] (including bounds), and [<typeArgs>]
/// applies those type parameter variables directly as type arguments to C.
///
/// @description Checks that tearing off named constructor with type arguments
/// is not allowed for a non-generic class.
/// @author iarkh@unipro.ru

class C {
  C.constr(int i) {}
}

main() {
  var v1 = C<int>.constr;
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  var v2 = C<dynamic>.constr;
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  var v3 = C<String, int, int>.constr;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}
