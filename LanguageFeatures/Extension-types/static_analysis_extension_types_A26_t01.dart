// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the body of a non-redirecting generative extension type
/// constructor, the static type of this is the same as it is in any instance
/// member of the extension type declaration.
///
/// @description Checks that static type of `this` in the body of
/// non-redirecting extension type constructor is `Name<X1, ..., Xk>`
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

extension type ET1(int id) {
  ET1.n(this.id) {
    this.expectStaticType<Exactly<ET1>>();
  }
}

extension type ET2<T>(int id) {
  ET2.n(this.id) {
    this.expectStaticType<Exactly<ET2<T>>>();
  }
}

main() {
  ET1.n(1);
  ET2<String>.n(2);
  ET2.n(3);
}
