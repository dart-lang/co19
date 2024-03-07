// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that null can be assigned to an extension type at run
/// time if its representation type is nullable
/// @author sgrekhov22@gmail.com

import "dart:async" show FutureOr;
import "../../Utils/expect.dart";

typedef VoidAlias = void;

extension type ET1<T extends int?>(T _) {}

extension type ET2<T extends Null>(T _) {}

extension type ET3<T extends dynamic>(T _) {}

extension type ET4<T extends FutureOr<Null>>(T _) {}

extension type ET5<T extends VoidAlias>(T _) {}

main() {
  ET1 et1 = null as dynamic;
  Expect.isNull(et1);
  ET2 et2 = null as dynamic;
  Expect.isNull(et2);
  ET3 et3 = null as dynamic;
  Expect.isNull(et3);
  ET4 et4 = null as dynamic;
  Expect.isNull(et4);
  ET5 et5 = null as dynamic;
  Expect.isNull(et5);
}
