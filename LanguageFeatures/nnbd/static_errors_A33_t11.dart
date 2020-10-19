/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use the null check operator (!) on an
 * expression of type T if T is strictly non-nullable
 *
// [error line 9, column 1]
// [web] A library can't opt out of null safety by default, when using sound null safety.
 * @description It is a warning to use the null check operator (!) on an
 * expression of type T if T is strictly non-nullable. Test FutureOr<A*>
 * @author sgrekhov@unipro.ru
 * @issue 39598
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "dart:async";
import "legacy_lib.dart";

main() {
  FutureOr<A> a = new A();
  a!;
//^
// [cfe] Operand of null-aware operation '!' has type 'FutureOr<A>' which excludes null.
// ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
}
