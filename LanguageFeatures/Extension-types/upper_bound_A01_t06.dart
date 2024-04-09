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
/// @description Check that the least upper bound calculation algorithm
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

extension type ET1<T>(T id) {}

extension type ET2<T extends String>(T id) implements ET1<T>, String {}
extension type ET3<T extends String>(T id) implements ET1<T?>, String {}

main() {
  var v1 = 2 > 1 ? ET2("ET2") : ET3("ET3");
  v1.expectStaticType<Exactly<String>>();

  var v2 = 2 > 1 ? "String" : ET2("ET2");
  v2.expectStaticType<Exactly<String>>();

  var v3 = 2 > 1 ? "String" : ET3("ET3");
  v3.expectStaticType<Exactly<String>>();

  var v4 = 2 > 1 ? "String" : ET1<String>("ET1");
  v4.expectStaticType<Exactly<Object?>>();

  var v5 = 2 > 1 ? "String" : ET1<String?>("ET1");
  v5.expectStaticType<Exactly<Object?>>();

  var v6 = 2 > 1 ? Object() : ET1<String>("ET1");
  v6.expectStaticType<Exactly<Object?>>();

  var v7 = 2 > 1 ? Object() : ET1<String?>("ET1");
  v7.expectStaticType<Exactly<Object?>>();
}
