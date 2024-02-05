// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types T1 and T2 to be UP(T1,T2)
/// as follows.
/// - UP(X1 & B1, T2) =
///   - T2 if X1 <: T2
///   - otherwise X1 if T2 <: X1
///   - otherwise UP(B1a, T2) where B1a is the greatest closure of B1 with
///     respect to X1, as defined in inference.md.
/// - UP(T1, X2 & B2) =
///   - X2 if T1 <: X2
///   - otherwise T1 if X2 <: T1
///   - otherwise UP(T1, B2a) where B2a is the greatest closure of B2 with
///     respect to X2, as defined in inference.md.
///
/// @description Check that upper bound of intersection types is calculated as
/// expected
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

int? foo() => DateTime.now().millisecondsSinceEpoch.isEven? null : 1;

void f<X extends num>(bool b, X x) {
  if (x is int) { // `x` promoted to `X & int`.
    var y1 = b ? x : null;
    y1.isEven; // Error. Type of `y1` is `int?`
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    X? z1 = y1;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

    var y2 = b ? foo() : x;
    y2.isEven;
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    y2.expectStaticType<Exactly<int?>>();
    X? z2 = y2;
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void main() {
  f<num>(false, 42);
}
