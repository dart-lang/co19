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

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

int? foo() => DateTime.now().millisecondsSinceEpoch.isEven? null : 1;

void f<X extends num>(X x) {
  if (x is int) { // `x` promoted to `X & int`.
    var y1 = 2 > 1 ? x : null;
    Expect.isTrue(y1?.isEven);
    y1.expectStaticType<Exactly<int?>>();

    var y2 = 1 > 2 ? foo() : x;
    Expect.isTrue(y2?.isEven);
    y2.expectStaticType<Exactly<int?>>();
  }
}

void main() {
  f<num>(42);
}
