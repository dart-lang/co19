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
///  There is one way in which the function object yielded by the instance
///  method closurization differs from the function object obtained by function
///  closurization on the above mentioned function literal: Assume that `o1` and
///  `o2` are objects, `m` is an identifier, and `c1` and `c2` are function
///  objects obtained by closurization of `m` on `o1` respectively `o2`. Then
///  `c1 == c2` evaluates to `true` if and only if `o1` and `o2` is the same
///  object.
///
/// @description Check that if `o1` and `o2` are objects, `m` is an identifier,
/// and `c1` and `c2` are function objects obtained by closurization of `m` on
/// `o1` respectively `o2`, then `c1 == c2` evaluates to `true` if and only if
/// `o1` and `o2` is the same object.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class C {
  num m(int r1, [String p1 = ""]) => r1;
}

main() {
  C o1 = C();
  C o2 = C();
  final f1 = o1.m;
  final f2 = o1.m;
  final f3 = o2.m;

  Expect.equals(f1, f2);
  Expect.notEquals(f1, f3);
}
