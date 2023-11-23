// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The goal is that you can always tear off a constructor, then
/// invoke the torn off function and get the same result as invoking the
/// constructor directly. For a named constructor it means that
///
///  var v1 = C.name(args);
///  var v2 = (C.name)(args);
//
///  // and
///
///  var v3 = C<typeArgs>.name(args);
///  var v4 = (C<typeArgs>.name)(args);
///  var v5 = (C.name)<typeArgs>(args);
///
/// should always give equivalent values for [v1] and [v2], and for [v3], [v4]
/// and [v5].
///
/// @description Checks that static type of the named constructor is checked
/// correctly for the generic class.
/// @author iarkh@unipro.ru

class C<T extends int> {
  C.constr(int i) {}
}

main() {
  var v1 = C.constr<String>;
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

  var v2 = (C.constr<String>);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  var v3 = (C.constr)<String>;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

  var v4 = C.constr<int, int>;
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  var v5 = (C.constr<int, int>);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  var v6 = (C.constr)<int, int>;
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}
