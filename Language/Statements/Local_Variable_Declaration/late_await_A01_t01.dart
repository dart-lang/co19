// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that D is a local variable declaration with the modifier
/// late that declares a variable v, which has an initializing expression e. It
/// is a compile-time error if e contains an await expression a, unless there is
/// a function f which is the immediately enclosing function for a, and f is not
/// the immediately enclosing function for D.
///
/// @description Checks that it is a compile-time error if initializing
/// expression of a late local variable contains an `await` expression
/// @author sgrekhov22@gmail.com

import 'dart:async';

Future<T> foo<T>(T t) => Future<T>.value(t);

main() async {
  late var v1 = await Future<int>.value(1);
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  late final v2 = await foo<int>(2);
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  late String v3 = await foo<String>("3");
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  late final int v4 = await Future<int>.value(4);
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  return 0;
}
