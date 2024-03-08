// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that T1, .. Ts are types, and V resolves to an extension
/// type declaration of the following form:
///
/// extension type V<X1 extends B1, .. Xs extends Bs>(T id) ... {
///   ... // Members.
/// }
/// ...
/// When s is zero (that is, the declaration of V is not generic), V<T1, .. Ts>
/// simply stands for V, a non-generic extension type. When s is greater than
/// zero, a raw occurrence V is treated like a raw type: Instantiation to bound
/// is used to obtain the omitted type arguments.
///
/// @description Checks that instantiation to bound is used to obtain the
/// omitted type arguments
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

extension type V1<T extends num>(int id) {}

extension type V2<T extends Object>(int id) {}

extension type V3<T extends Object?>(int id) {}

main() {
  var v1 = V1(42);
  v1.expectStaticType<Exactly<V1<num>>>();

  var v2 = V2(42);
  v2.expectStaticType<Exactly<V2<Object>>>();

  var v3 = V3(42);
  v3.expectStaticType<Exactly<V3<Object?>>>();
}
