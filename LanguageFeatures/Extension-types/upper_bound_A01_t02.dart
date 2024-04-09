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
/// @description Check that for two extension types `ET<T1>` and `ET<T2>` the
/// least upper bound is `ET<T>` where `T` is least upper bound of `T1` and `T2`
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

extension type ET<T>(T o) {}

main() {
  var v1 = 2 > 1 ? ET<Object?>(Object()) : ET<Object?>(Object());
  v1.expectStaticType<Exactly<ET<Object?>>>();

  var v2 = 2 > 1 ? ET<Object>(Object()) : ET<String>("String");
  v2.expectStaticType<Exactly<ET<Object>>>();

  var v3 = 2 > 1 ? ET<int>(1) : ET<String>("String");
  v3.expectStaticType<Exactly<ET<Object>>>();

  var v4 = 2 > 1 ? ET<int?>(2) : ET<String>("String");
  v4.expectStaticType<Exactly<ET<Object?>>>();

  var v5 = 2 > 1 ? ET<int>(3) : ET<num>(4);
  v5.expectStaticType<Exactly<ET<num>>>();

  var v6 = 2 > 1 ? ET<int?>(3) : ET<num>(4);
  v6.expectStaticType<Exactly<ET<num?>>>();
}
