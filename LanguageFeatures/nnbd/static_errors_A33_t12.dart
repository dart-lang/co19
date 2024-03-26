// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a warning to use the null check operator (!) on an
/// expression of type T if T is strictly non-nullable
///
/// @description It is a warning to use the null check operator (!) on an
/// expression of type T if T is strictly non-nullable. Test FutureOr<FutureOr<A>>
/// @author sgrekhov@unipro.ru
/// @issue 39598

import "dart:async";

class A {}

main() {
  FutureOr<FutureOr<A>> a = new A();
  a!;
// ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
}
