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
/// into account `Object?`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/static_type_helper.dart';

extension type ET1<T>(T id) {}
extension type ET2<T>(T id) {}

extension type ET3<T extends String>(T id) implements ET1<T>, String {}
extension type ET4<T extends int>(T id) implements ET2<T?>, num {}

main() {
  var v1 = 2 > 1 ? ET1<String>("String") : ET2<num>(1);
  v1.expectStaticType<Exactly<Object>>();

  var v2 = 2 > 1 ? ET1<String>("String") : ET2<String?>("String");
  v2.expectStaticType<Exactly<Object?>>();

  var v3 = 2 > 1 ? ET3("String") : ET4(3);
  v3.expectStaticType<Exactly<Object?>>();

  var v4 = 2 > 1 ? ET1<String>("String") : ET3("String");
  v4.expectStaticType<Exactly<ET1<String>>>();

  var v5 = 2 > 1 ? ET1<String?>("String") : ET3("String");
  v5.expectStaticType<Exactly<ET1<String?>>>();

  var v6 = 2 > 1 ? ET2<num>(4) : ET4(5);
  v6.expectStaticType<Exactly<Object>>();
}
