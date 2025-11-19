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
/// factory constructor. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

extension type ET1(int v) {
  factory ET1.someName(int v) => ET1(v);
}

extension type const ET2.someName(final int v) {
  const factory ET2(int v) = ET2.someName;
}

main() {
  Expect.equals(1, ET1(1).v);
  Expect.equals(2, ET2(2).v);
}
