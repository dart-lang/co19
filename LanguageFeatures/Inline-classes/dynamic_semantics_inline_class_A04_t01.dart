// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type V used as an expression (a type literal)
/// evaluates to the value of the extension type erasure of the representation
/// type used as an expression
///
/// @description Check that if an extension type is used as an expression then
/// it evaluates to the value of the corresponding instantiated representation
/// type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type V1(int id) {}

extension type V2<T>(T Function(int) id) {}

main() {
  Expect.equals(int, V1);
  Expect.equals(V2<bool>, typeOf<bool Function(int)>());
}
