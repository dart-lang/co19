// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// ...
/// - An actual parameter expression corresponding to a formal parameter whose
///   statically known type annotation is `void` may have type `void`.
///
/// @description Checks that an actual parameter expression corresponding to a
/// formal parameter whose statically known type annotation is `void` may have
/// type `void`. Test an extension type.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

extension type ET<X>(X x) {
  Object? foo(X x) => x;
  static Object? bar<T>(T t) => t;
}

void main() {
  void v = 42;
  Expect.equals(42, ET<void>(v).x as int);
  Expect.equals(42, ET<void>(v).foo(v));
  Expect.equals(42, ET.bar<void>(v));
}
