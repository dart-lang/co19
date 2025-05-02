// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks static type of a variable after assignment with a
/// supertype of the declared type as type of interest.
/// @author sgrekhov22@gmail.com
/// @issue 60620, 60622

import '../../Utils/static_type_helper.dart';

main() {
  String s = "a";
  if (s is Pattern) {}
  s = "";
  s.expectStaticType<Exactly<String>>();
}
