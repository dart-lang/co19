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
/// assignment cannot be performed. Test type `void` as `T`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

typedef Void = void;

main() {
  Object? s = "x";
  s as String;
  if (s is Void) {} // ignore: unnecessary_type_check
  s = 1; // Cannot assign `void`, let's assign `int <: void`
  s.expectStaticType<Exactly<Object>>();
}
