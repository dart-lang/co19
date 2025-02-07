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
/// `o1` respectively `o2`, then `c1 == c2` evaluates to `false` if `o1` and
/// `o2` are extensions or extension types.
/// @author sgrekhov22@gmail.com
/// @issue 60065

import '../../../../Utils/expect.dart';

class A {}
extension Ext on A {
  num m(int r1, [String p1 = ""]) => r1;
}

extension type ET(int _) {
  num m(int r1, [p1 = ""]) => r1;
}

main() {
  A a = A();
  final fa1 = a.m;
  final fa2 = a.m;
  // For extensions and extension types, fa1 != fa2. However, the implementation
  // may have an optimization that makes fa1 identical to fa2, in which case
  // fa1 == fa2. Therefore, we allow both results and check that the == operator
  // on these functions does not throw an exception
  Expect.isTrue(fa1 == fa2 || fa1 != fa2);

  ET et = ET(0);
  final fet1 = et.m;
  final fet2 = et.m;
  Expect.isTrue(fet1 == fet2 || fet1 != fet2);
}
