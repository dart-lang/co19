// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The Dart 1 algorithm which is used to compute the standard upper
/// bound of two distinct interface types will work in the same way as it does
/// today, albeit on a slightly different superinterface graph:
///
/// For the purpose of this algorithm, we consider `Object?` to be a
/// superinterface of `Null` and `Object`, and the path lengths mentioned in the
/// algorithm will increase by one (because they start from `Object?` rather
/// than from `Object`).
///
/// @description Check that the least upper bound calculation algorithm takes
/// starts from `Object?`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/static_type_helper.dart';

extension type ET1(String s) {}
extension type ET2(num? n) {}

extension type ET3(String s) implements ET1, String {}
extension type ET4(int i) implements ET2, int {}

main() {
  var v1 = 2 > 1 ? ET1("String") : ET2(1);
  v1.expectStaticType<Exactly<Object?>>();

  var v2 = 2 > 1 ? ET1("String") : ET3("String");
  v2.expectStaticType<Exactly<Object>>();

  var v3 = 2 > 1 ? ET2(2) : ET4(3);
  v3.expectStaticType<Exactly<Object?>>();

  var v4 = 2 > 1 ? ET2(2) : ET3("String");
  v4.expectStaticType<Exactly<Object?>>();
}
