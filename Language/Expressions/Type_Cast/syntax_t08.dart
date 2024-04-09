// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The cast expression ensures that an object is a member of a type.
/// ⟨typeCast⟩ ::= ⟨asOperator⟩ ⟨typeNotVoid⟩
/// ⟨asOperator⟩ ::= as
///
/// @description Checks that it is not an error when the second argument of a
/// type cast operator is an alias of a type `void` or an extension type with
/// representation type `void` or `FutureOr<void>`
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../../Utils/expect.dart';

typedef VoidAlias = void;

extension type VoidET(void _) {}

void foo() {
  var v = 1 as VoidAlias;
  return v;
}

main() {
  var v1 = 1 as VoidET;
  Expect.equals(int, v1.runtimeType);

  var v2 = 2 as FutureOr<void>;
  Expect.equals(int, v2.runtimeType);
}
