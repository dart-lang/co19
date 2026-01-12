// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, mixin class, enum, or extension type
/// declaration `D` with a primary constructor (note that it cannot be a
/// `<mixinApplicationClass>`, because that kind of declaration does not
/// syntactically support primary constructors). This declaration is treated as
/// a class, mixin class, enum, respectively extension type declaration without
/// a primary constructor which is obtained as described in the following. This
/// determines the dynamic semantics of a primary constructor.
///
/// A compile-time error occurs if the body of `D` contains a non-redirecting
/// generative constructor, unless `D` is an extension type.
///
/// @description Check that it is not an error if the body of `D` contains a
/// redirecting generative constructor. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

enum E1(final int v) {
  e0(1), e1.someName(2);

  const E1.someName(int v) : this(v);
}

enum const E2.someName(final int v) {
  e0.someName(1), e1(2);

  const E2(int v) : this.someName(v);
}

main() {
  Expect.equals(1, E1.e0.v);
  Expect.equals(2, E1.e1.v);
  Expect.equals(1, E2.e0.v);
  Expect.equals(2, E2.e1.v);
}
