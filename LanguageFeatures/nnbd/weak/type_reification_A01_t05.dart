// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All types reified in legacy libraries are reified as legacy types.
/// @description Check that runtime type of the object of the class imported from
/// opted to legacy library is a legacy type.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
import '../../../Utils/expect.dart';
import 'type_reification_legacy_aliases_lib.dart';

typedef AliasA = A;

main() {
  var a = AliasA();
  Expect.isTrue(a is AliasA);
  Expect.isTrue(a is AliasA?);
  Expect.isTrue(a is A);
  Expect.isTrue(a is A?);
  Expect.isFalse(a is A1);
  Expect.isFalse(a is A1?);
  Expect.runtimeIsType<AliasA>(a);
  Expect.runtimeIsType<AliasA?>(a);
  Expect.runtimeIsType<A>(a);
  Expect.runtimeIsType<A?>(a);
  Expect.runtimeIsNotType<A1>(a);
  Expect.runtimeIsNotType<A1?>(a);
}
