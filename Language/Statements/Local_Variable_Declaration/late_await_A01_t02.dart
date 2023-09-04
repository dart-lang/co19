// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that D is a local variable declaration with the modifier
/// late that declares a variable v, which has an initializing expression e. It
/// is a compile-time error if e contains an await expression a, unless there is
/// a function f which is the immediately enclosing function for a, and f is not
/// the immediately enclosing function for D.
///
/// @description Checks that it is not an error if there is a function `f` which
/// is the immediately enclosing function for `a`, and `f` is not the
/// immediately enclosing function for `D`
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../../Utils/static_type_helper.dart';

Future<T> foo<T>(T t) => Future<T>.value(t);

main() {
  late var v1 = () async => await Future<int>.value(1);
  v1.expectStaticType<Exactly<Future<int> Function()>>();

  late final v2 = () async {return await foo<int>(2);};
  v2.expectStaticType<Exactly<Future<int> Function()>>();

  late Future<String> v3 = () async {return await foo<String>("3");}();
  print(v3);

  late final Future<int> Function() v4 = () async => await Future<int>.value(4);
  print(v4);
}
