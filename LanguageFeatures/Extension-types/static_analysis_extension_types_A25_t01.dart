// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type V used as an expression (a type literal) is
/// allowed, and it has static type Type.
///
/// @description Checks that an extension type `V` can be used as an expression
/// (a type literal) is and has static type `Type`.
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

extension type V(int id) {}

main() {
  var t = V;
  t.expectStaticType<Exactly<Type>>();
}
