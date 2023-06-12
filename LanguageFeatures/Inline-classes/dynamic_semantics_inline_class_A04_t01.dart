// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An inline type V used as an expression (a type literal) evaluates
/// to the value of the corresponding instantiated representation type used as
/// an expression.
///
/// @description Check that if an inline type `V` is used as an expression then
/// it evaluates to the value of the corresponding instantiated representation
/// type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class V {
  final int id;
  V(this.id);
}

main() {
  Type t = V;
  Expect.equals(int, t);
}
