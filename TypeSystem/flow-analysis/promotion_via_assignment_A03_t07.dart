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
/// @description Checks that if `T` is not subtype of `S` then promotion via
/// assignment cannot be performed. Test type `Null`;
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

main() {
  String s = "x";
  if (s is Null) {} // ignore: unnecessary_type_check
  s = "y";
  s.expectStaticType<Exactly<String>>();
}
