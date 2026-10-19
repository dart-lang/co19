// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e != null` or of the form `e is T` where `e`
/// has static type `T?` promotes the type of `e` to `T` in the `true`
/// continuation, and to `Null` in the `false` continuation.
///
/// @description Check that a check of the form `e != null` does not promote the
/// type of `e` to `Null` in the `false` continuation. Test type aliases.
/// @note This is contrary to the assertion, but it is how it currently works
/// and is expected. See https://github.com/dart-lang/language/issues/4742.
/// @author sgrekhov@unipro.ru

import '../../Utils/static_type_helper.dart';

class A {
  foo() {}
}

typedef AAlias1 = A?;
typedef AAlias2 = AAlias1?;

main() {
  var a1 = new A() as AAlias1;
  if (a1 != null) {
  } else {
    a1.expectStaticType<Exactly<A?>>();
    a1.foo();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var a2 = new A() as AAlias2?;

  if (a2 != null) {
  } else {
    a2.expectStaticType<Exactly<A?>>();
    a2.foo();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
