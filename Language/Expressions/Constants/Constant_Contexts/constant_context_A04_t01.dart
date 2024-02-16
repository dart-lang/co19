// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be an expression; e occurs in a constant context iff one of
/// the following applies:
/// ...
/// • e is the initializing expression of a constant variable declaration
///
/// @description Checks that an expression `e` is a constant expression if `e`
/// is the initializing expression of a constant variable declaration
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class C {
  final val;
  const C(this.val);
}

main() {
  const c = C(1);
  Expect.identical(c, const C(1));
}
