// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a warning to use the null check operator (!) on an
/// expression of type T if T is strictly non-nullable
///
/// @description It is a warning to use the null check operator (!) on an
/// expression of type T if T is strictly non-nullable. Test FutureOr<A>
/// @author sgrekhov@unipro.ru
/// @issue 39598


import "dart:async";

class A {}

main() {
  FutureOr<A> a = new A();
  a!;
//^
// [cfe] Operand of null-aware operation '!' has type 'FutureOr<A>' which excludes null.
// ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
}
