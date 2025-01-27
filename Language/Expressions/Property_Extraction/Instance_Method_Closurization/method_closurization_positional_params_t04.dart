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
///  Let `X′1,...,X′s`′ be the formal type parameters of the class of `o`, and
///  `t′1,...,t′s′` be the actual type arguments. Then
///  `B′ j = [t′ 1/X′ 1,...,t′ s′ /X′ s′ ]Bj, j ∈ 1..s`.
///
/// @description Check that if `o` is an instance of a generic class, then
/// `B′ j = [t′ 1/X′ 1,...,t′ s′ /X′ s′ ]Bj, j ∈ 1..s`.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/static_type_helper.dart';

class C<X0 extends int, X1 extends num, X2 extends X1> {
  X0 m(X1 r1, [X2? p1]) {
    return (r1 + p1!) as X0;
  }
}

main() {
  C<int, num, double> o = C<int, num, double>();
  final f = o.m;
  f.expectStaticType<Exactly<int Function(num r1, [double? p1])>>();
}
