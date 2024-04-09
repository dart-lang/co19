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
/// @description Check that for two extension types with the representation
/// types `Object?` and `Object` the least upper bound is `Object?` (and if both
/// of them have representation type `Object` then the least upper bound is
/// `Object`)
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

extension type ET1(Object? o) {}
extension type ET2(Object o) {}

extension type ET3(Object? o) implements ET1 {}
extension type ET4(Object o) implements ET2 {}

main() {
  var v1 = 2 > 1 ? ET1(Object()) : ET2(Object());
  v1.expectStaticType<Exactly<Object?>>();

  var v2 = 2 > 1 ? ET1(null) : ET2("String");
  v2.expectStaticType<Exactly<Object?>>();

  var v3 = 2 > 1 ? ET1(Object()) : ET3(Object());
  v3.expectStaticType<Exactly<ET1>>();

  var v4 = 2 > 1 ? ET1(Object()) : ET4(Object());
  v4.expectStaticType<Exactly<Object?>>();

  var v5 = 2 > 1 ? ET2(Object()) : ET4(Object());
  v5.expectStaticType<Exactly<ET2>>();
}
