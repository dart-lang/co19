// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be an expression; e occurs in a constant context iff one of
/// the following applies:
/// ...
/// • e occurs as @e in a construct derived from ⟨metadata⟩.
///
/// @description Checks that an expression `e` is a constant expression if `e`
/// occurs as `@e` in a construct derived from ⟨metadata⟩
/// @author sgrekhov22@gmail.com

import 'dart:mirrors';
import '../../../../Utils/expect.dart';

class C {
  final val;
  const C(this.val);
}

@C(1)
class A {}

main() {
  Expect.identical(const C(1), reflectClass(A).metadata[0].reflectee);
}
