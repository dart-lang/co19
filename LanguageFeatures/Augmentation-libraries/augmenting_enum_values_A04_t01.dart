// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting an existing enum value never changes the order in
/// which it appears in `values`.
///
/// @description Checks that an augmenting declaration of an existing enum value
/// never changes the order in which it appears in `values`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_enum_values_A04_t01_lib.dart';

enum E {
  e0, e1, e2, e3;
}

main() {
  Expect.listEquals([E.e0, E.e1, E.e2, E.e3], E.values);
}
