// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `o` be an object, and let `u` be a fresh final variable bound
/// to o. The closurization of method `f` on object `o` is defined to be
/// equivalent to:
/// ```
/// - <X1 extends B′1, ..., Xs extends B′s>
///     (T1 p1, ..., Tn pn, {Tn+1 pn+1 = d1, ..., Tn+k pn+k = dk}) =>
///       u.m<X1, ..., Xs>(p1, ..., pn, pn+1: pn+1, ..., pn+k: pn+k);
///  ```
///  where `f` is an instance method named `m` which has type parameter
///  declarations `X1 extends B1, ..., Xs extends Bs`, required parameters
///  `p1, ..., pn`, and named parameters `pn+1, ..., pn+k` with defaults
///  `d1, ..., dk`, using `null` for parameters whose default value is not
///  specified.
///  ...
///  The parameter types `Tj,j ∈ 1..n + k`, are determined as follows: Let the
///  method declaration `D` be the implementation of `m` which is invoked by the
///  expression in the body. Let `T` be the class that contains D.
///
///  For each parameter `pj, j ∈ 1..n + k`, if `pj` is covariant then `Tj` is
///  the built-in class `Object`.
///
/// @description Check that if `pj` is covariant then `Tj` is `Object?` at
/// run time.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';
import '../../../../Utils/static_type_helper.dart';

class C<X extends num> {
  X m<Y extends X>(
    covariant X r1,
    covariant Y r2, {
    required covariant int p1,
  }) {
    return 42 as X;
  }
}

main() {
  var o = C<num>();
  final f = o.m;
  f.expectStaticType<
        Exactly<num Function<Y extends num>(num r1, Y r2, {required int p1})>
      >();

  Expect.isTrue(
    f is num Function<Y extends num>(
          Object? r1,
          Object? r2, {
          required Object? p1,
        }),
  );
}
