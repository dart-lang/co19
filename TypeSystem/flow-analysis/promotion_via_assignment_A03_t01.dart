// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a variable `x` is promotable via assignment of an
/// expression of type `T` given variable model `VM` if
/// - `VM = VariableModel(declared, promoted, tested, assigned, unassigned,
///     captured)`
/// - and captured is false
/// - and `S` is the current type of `x` in `VM`
/// - and `T <: S` and not `S <: T`
/// - and `T` is a type of interest for `x` in `tested`
///
/// @description Checks that if `S <: T` then promotion via assignment is not
/// performed
/// @author sgrekhov@unipro.ru

import '../../Utils/static_type_helper.dart';

class S {
  num answer() => 42.42;
}

class T extends S {
  @override
  int answer() => 42;
}

main() {
  T t = T();
  if (t is S) {} // ignore: unnecessary_type_check
  t.answer.expectStaticType<Exactly<int Function()>>();
}
