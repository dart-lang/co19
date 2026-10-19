// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e == null` or of the form `e is Null` where
/// `e` has static type `T` promotes the type of `e` to `Null` in the `true`
/// continuation, and to `NonNull(T)` in the `false` continuation.
///
/// @description Check that a check of the form `e == null` does not promote `e`
/// to `Null` in the `true` continuation.
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

dynamic init() => null;

main() {
  A? a = init();
  if (a == null) {
    a.expectStaticType<Exactly<A?>>();
  }

  B? b1 = init();
  if (b1 == null) {
    b1.expectStaticType<Exactly<B?>>();
  }

  B<int>? b2 = init();
  if (b2 == null) {
    b2.expectStaticType<Exactly<B<int>?>>();
  }

  int? i = init();
  if (i == null) {
    i.expectStaticType<Exactly<int?>>();
  }
}
