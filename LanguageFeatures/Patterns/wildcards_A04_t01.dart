// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// If the variable's name is _, it doesn't bind any variable. This "wildcard"
/// name is useful as a placeholder in places where you need a subpattern in
/// order to destructure later positional values:
/// ```dart
/// var list = [1, 2, 3];
/// var [_, two, _] = list;
/// ```
/// The `_` identifier can also be used with a type annotation when you want to
/// test a value's type but not bind the value to a name:
/// ```dart
/// switch (record) {
///   case (int _, String _):
///     print('First field is int and second is String.');
/// }
/// ```
/// @description Checks that an initializer is executed for wildcards.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

String _log = "";

int init(int val) {
  _log = "init($val);";
  return val;
}

class C {
  int a;
  C(this.a);
}

main() {
  var (_) = (init(1));
  Expect.equals("init(1);", _log);

  final [_] = [init(2)];
  Expect.equals("init(2);", _log);

  var {"key1": _} = {"key1": init(3)};
  Expect.equals("init(3);", _log);

  var (_,) = (init(4),);
  Expect.equals("init(4);", _log);

  var C(a: _) = C(init(5));
  Expect.equals("init(5);", _log);
}
