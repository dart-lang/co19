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
/// run time. Test covariant-by-class parameters.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';
import '../../../../Utils/static_type_helper.dart';

class C<X> {
  X m<Y extends X>(X r1, Y r2, {required X p1}) {
    return 42 as X;
  }
}

mixin M<X> {
  X m<Y extends X>(X r1, Y r2, {required X p1}) {
    return 42 as X;
  }
}
class MO<X> = Object with M<X>;

enum E<X> {
  e0;
  X m<Y extends X>(X r1, Y r2, {required X p1}) {
    return 42 as X;
  }
}

class A<X> {}
extension Ext<X> on A<X> {
  X m<Y extends X>(X r1, Y r2, {required X p1}) {
    return 42 as X;
  }
}

extension type ET<X>(int _) {
  X m<Y extends X>(X r1, Y r2, {required X p1}) {
    return 42 as X;
  }
}

main() {
  C<Object?> c = C<Object?>();
  final fc = c.m;
  fc.expectStaticType<
        Exactly<
          Object? Function<Y extends Object?>(
            Object? r1,
            Y r2, {
            required Object? p1,
          })
        >
      >();

  Expect.isTrue(
    fc is Object? Function<Y extends Object?>( // ignore: unnecessary_type_check
          Object? r1,
          Y r2, {
          required Object? p1,
        }),
  );

  M<Object?> m = MO<Object?>();
  final fm = m.m;
  fm.expectStaticType<
      Exactly<
          Object? Function<Y extends Object?>(
              Object? r1,
              Y r2, {
              required Object? p1,
              })
      >
  >();

  Expect.isTrue(
    fm is Object? Function<Y extends Object?>( // ignore: unnecessary_type_check
        Object? r1,
        Y r2, {
        required Object? p1,
        }),
  );

  final fe = E.e0.m;
  fe.expectStaticType<
      Exactly<
          Object? Function<Y extends Object?>(
              Object? r1,
              Y r2, {
              required Object? p1,
              })
      >
  >();

  Expect.isTrue(
    fe is Object? Function<Y extends Object?>( // ignore: unnecessary_type_check
        Object? r1,
        Y r2, {
        required Object? p1,
        }),
  );

  A<Object?> a = A<Object?>();
  final fa = a.m;
  fa.expectStaticType<
      Exactly<
          Object? Function<Y extends Object?>(
              Object? r1,
              Y r2, {
              required Object? p1,
              })
      >
  >();

  Expect.isTrue(
    fa is Object? Function<Y extends Object?>( // ignore: unnecessary_type_check
        Object? r1,
        Y r2, {
        required Object? p1,
        }),
  );

  ET<Object?> et = ET<Object?>(0);
  final fet = et.m;
  fet.expectStaticType<
      Exactly<
          Object? Function<Y extends Object?>(
              Object? r1,
              Y r2, {
              required Object? p1,
              })
      >
  >();

  Expect.isTrue(
    fet is Object? Function<Y extends Object?>( // ignore: unnecessary_type_check
        Object? r1,
        Y r2, {
        required Object? p1,
        }),
  );
}
