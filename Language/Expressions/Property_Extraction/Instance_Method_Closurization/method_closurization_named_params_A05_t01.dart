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
///  ...
///  Otherwise `T` is a generic instantiation of a generic class `G`. Let
///  `X′′1,...,X′′s′′` be the formal type parameters of `G`, and
///  `t′′1,...,t′′s′′` be the actual type arguments of `o` at `T`. Then `Tj` is
///  a type annotation that denotes `[t′′ 1/X′′ 1,...,t′′ s′′ /X′′ s′′]Sj`,
///  where `Sj` is the type annotation of the corresponding parameter in `D`. If
///  that parameter declaration has no type annotation then `Tj` is `dynamic`.
///
/// @description Check that if `T` is a generic instantiation of a generic class
/// `G` then `Tj` is a type annotation that denotes
/// `[t′′ 1/X′′ 1,...,t′′ s′′ /X′′ s′′]Sj`, where `Sj` is the type annotation of
/// the corresponding parameter in `D`. If that parameter declaration has no
/// type annotation then `Tj` is `dynamic`.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';
import '../../../../Utils/static_type_helper.dart';

class C<Z extends String> {
  List<Y> m<X, Y extends num>(
    List<Z> r1,
    List<Y> r2,
    r3, {
    List<X>? p1,
    List<int> p2 = const [],
    p3 = const [],
  }) {
    return <Y>[];
  }
}

mixin M<Z extends String> {
  List<Y> m<X, Y extends num>(
      List<Z> r1,
      List<Y> r2,
      r3, {
        List<X>? p1,
        List<int> p2 = const [],
        p3 = const [],
      }) {
    return <Y>[];
  }
}
class MO<Z extends String> = Object with M<Z>;

enum E<Z extends String> {
  e0;
  List<Y> m<X, Y extends num>(
      List<Z> r1,
      List<Y> r2,
      r3, {
        List<X>? p1,
        List<int> p2 = const [],
        p3 = const [],
      }) {
    return <Y>[];
  }
}

class A<Z extends String>{}
extension Ext<Z extends String> on A<Z> {
  List<Y> m<X, Y extends num>(
      List<Z> r1,
      List<Y> r2,
      r3, {
        List<X>? p1,
        List<int> p2 = const [],
        p3 = const [],
      }) {
    return <Y>[];
  }
}

extension type ET<Z extends String>(int _) {
  List<Y> m<X, Y extends num>(
      List<Z> r1,
      List<Y> r2,
      r3, {
        List<X>? p1,
        List<int> p2 = const [],
        p3 = const [],
      }) {
    return <Y>[];
  }
}

main() {
  var c = C<String>();
  final fc = c.m;
  fc.expectStaticType<
        Exactly<
          List<Y> Function<X, Y extends num>(
            List<String> r1,
            List<Y> r2,
            dynamic r3, {
            List<X>? p1,
            List<int> p2,
            dynamic p3,
          })
        >
      >();
  Expect.isTrue(
    fc is List<Y> Function<X, Y extends num>( // ignore: unnecessary_type_check
        List<String> r1,
        List<Y> r2,
        dynamic r3, {
        List<X>? p1,
        List<int> p2,
        dynamic p3,
        })
  );

  M<String> m = MO<String>();
  final fm = m.m;
  fc.expectStaticType<
      Exactly<
          List<Y> Function<X, Y extends num>(
              List<String> r1,
              List<Y> r2,
              dynamic r3, {
              List<X>? p1,
              List<int> p2,
              dynamic p3,
              })
      >
  >();
  Expect.isTrue(
      fm is List<Y> Function<X, Y extends num>( // ignore: unnecessary_type_check
          List<String> r1,
          List<Y> r2,
          dynamic r3, {
          List<X>? p1,
          List<int> p2,
          dynamic p3,
          })
  );

  final fe = E.e0.m;
  fe.expectStaticType<
      Exactly<
          List<Y> Function<X, Y extends num>(
              List<String> r1,
              List<Y> r2,
              dynamic r3, {
              List<X>? p1,
              List<int> p2,
              dynamic p3,
              })
      >
  >();
  Expect.isTrue(
      fe is List<Y> Function<X, Y extends num>( // ignore: unnecessary_type_check
          List<String> r1,
          List<Y> r2,
          dynamic r3, {
          List<X>? p1,
          List<int> p2,
          dynamic p3,
          })
  );

  var a = A<String>();
  final fa = a.m;
  fa.expectStaticType<
      Exactly<
          List<Y> Function<X, Y extends num>(
              List<String> r1,
              List<Y> r2,
              dynamic r3, {
              List<X>? p1,
              List<int> p2,
              dynamic p3,
              })
      >
  >();
  Expect.isTrue(
      fa is List<Y> Function<X, Y extends num>( // ignore: unnecessary_type_check
          List<String> r1,
          List<Y> r2,
          dynamic r3, {
          List<X>? p1,
          List<int> p2,
          dynamic p3,
          })
  );

  var et = ET<String>(0);
  final fet = et.m;
  fet.expectStaticType<
      Exactly<
          List<Y> Function<X, Y extends num>(
              List<String> r1,
              List<Y> r2,
              dynamic r3, {
              List<X>? p1,
              List<int> p2,
              dynamic p3,
              })
      >
  >();
  Expect.isTrue(
      fet is List<Y> Function<X, Y extends num>( // ignore: unnecessary_type_check
          List<String> r1,
          List<Y> r2,
          dynamic r3, {
          List<X>? p1,
          List<int> p2,
          dynamic p3,
          })
  );
}
