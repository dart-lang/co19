// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e != null` or of the form `e is T` where `e`
/// has static type `T?` promotes the type of `e` to `T` in the `true`
/// continuation, and to `Null` in the `false` continuation.
///
/// @description Check that a check of the form `e != null` doesn't promote the
/// type of `e` to `Null` in the `false` continuation.
/// @note This is contrary to the assertion, but it is how it currently works
/// and is expected. See https://github.com/dart-lang/language/issues/4742.
/// @author sgrekhov@unipro.ru

import '../../Utils/static_type_helper.dart';

class A {
  foo() {}
}

class B<T> {
  bar() {}
}

main() {
  var a = new A() as A?;
  if (a != null) {
  } else {
    a.expectStaticType<Exactly<A?>>();
    a.foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var b1 = new B() as B?;
  if (b1 != null) {
  } else {
    b1.expectStaticType<Exactly<B?>>();
    b1.bar();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var b2 = new B<int>() as B<int>?;
  if (b2 != null) {
  } else {
    b2.expectStaticType<Exactly<B?>>();
    b2.bar();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var i = 42 as int?;
  if (i != null) {
  } else {
    i.expectStaticType<Exactly<int?>>();
    i.isOdd;
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
