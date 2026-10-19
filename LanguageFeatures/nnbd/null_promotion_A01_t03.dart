// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e == null` or of the form `e is Null` where
/// `e` has static type `T` promotes the type of `e` to `Null` in the `true`
/// continuation, and to `NonNull(T)` in the `false` continuation.
///
/// @description Check that a check of the form `e is Null` promotes `e` to
/// `Null` in the `true` continuation but `e == null` doesn't. Test type aliases.
/// @note This is contrary to the assertion, but it is how it currently works
/// and is expected. See https://github.com/dart-lang/language/issues/4742.
/// @author sgrekhov@unipro.ru

import '../../Utils/static_type_helper.dart';

class A {
  foo() {}
}

typedef AAlias1 = A?;
typedef AAlias2 = AAlias1?;

dynamic init() => null;

main() {
  AAlias1 a1 = init();
  if (a1 is Null) {
    a1.expectStaticType<Exactly<Null>>();
  }

  if (a1 == null) {
    a1.expectStaticType<Exactly<A?>>();
  }

  AAlias2? a2 = init();
  if (a2 is Null) {
    a2.expectStaticType<Exactly<Null>>();
  }

  if (a2 == null) {
    a2.expectStaticType<Exactly<A?>>();
  }
}
