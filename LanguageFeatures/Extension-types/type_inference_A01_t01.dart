// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type inference works for extension types as for regular types
///
/// @description Check that type inference works for extension types. Type can
/// be inferred from an extension type to its representation type and back
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

enum E<T> {
  a<int>(),
  b<String>(),
}

extension type ET1<T>(E<T> _) {}
extension type ET2<T>(E<T> _) implements E<T> {}

main() {
  var v1 = ET1(E.a);
  v1.expectStaticType<Exactly<ET1<int>>>();

  var v2 = ET2(E.b);
  v2.expectStaticType<Exactly<ET2<String>>>();
}
