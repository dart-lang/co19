// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `o` be an object, and let `u` be a fresh final variable bound
/// to o. The closurization of method `f` on object `o` is defined to be
/// equivalent to:
/// ...
/// ```
/// - <X1 extends B′1, ..., Xs extends B′s>
///   (T1 p1, ..., Tn pn, [Tn+1 pn+1 = d1, ..., Tn+k pn+k = dk]) =>
///     u.m<X1, ..., Xs>(p1, ..., pn+k);
///  ```
///  where `f` is an instance method named `m` which has type parameter
///  declarations `X1 extends B1, ..., Xs extends Bs`, required parameters
///  `p1, ..., pn`, and optional positional parameters `pn+1, ..., pn+k` with
///  defaults `d1, ..., dk`, using `null` for parameters whose default value is
///  not specified.
///  ...
///  The parameter types `Tj,j ∈ 1..n + k`, are determined as follows: Let the
///  method declaration `D` be the implementation of `m` which is invoked by the
///  expression in the body. Let `T` be the class that contains D.
///  ...
///  If `T` is a non-generic class then for `j ∈ 1..n+k, Tj` is a type
///  annotation that denotes the same type as that which is denoted by the type
///  annotation on the corresponding parameter declaration in `D`. If that
///  parameter declaration has no type annotation then `Tj` is `dynamic`.
///
/// @description Check that if `T` is a non-generic class then for
/// `j ∈ 1..n+k, Tj` is a type annotation that denotes the same type as that
/// which is denoted by the type annotation on the corresponding parameter
/// declaration in `D` or `dynamic` if the parameter declaration has no type
/// annotation.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';
import '../../../../Utils/static_type_helper.dart';

class C<Z extends String> {
  Y m<X, Y extends num>(Z r1, Y r2, r3, [X? p1, int p2 = 0, p3]) {
    return 42 as Y;
  }
}

main() {
  var o = C<String>();
  final f = o.m;
  f.expectStaticType<
        Exactly<
          Y Function<X, Y extends num>(
            String r1,
            Y r2,
            dynamic r3, [
            X? p1,
            int p2,
            dynamic p3,
          ])
        >
      >();

  Expect.isTrue(
    f is Y Function<X, Y extends num>( // ignore: unnecessary_type_check
          String r1,
          Y r2,
          dynamic r3, [
          X? p1,
          int p2,
          dynamic p3,
        ])
  );
}
