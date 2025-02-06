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
/// @issue 60065

import '../../../../Utils/expect.dart';

class C {
  num m(int r1, {String p1 = ""}) => r1;
}

mixin M {
  num m(int r1, {covariant String p1 = ""}) => r1;
}
class MO = Object with M;

enum E {
  e0, e1;
  num m(int r1, {required String p1}) => r1;
}

class A {}
extension Ext on A {
  num m(int r1, {String p1 = ""}) => r1;
}

extension type ET(int _) {
  num m(int r1, {p1 = ""}) => r1;
}

main() {
  C c = C();
  final fc1 = c.m;
  final fc2 = c.m;
  final fc3 = C().m;
  Expect.equals(fc1, fc2);
  Expect.notEquals(fc1, fc3);

  M m = MO();
  final fm1 = m.m;
  final fm2 = m.m;
  final fm3 = MO().m;
  Expect.equals(fm1, fm2);
  Expect.notEquals(fm1, fm3);

  final fe1 = E.e0.m;
  final fe2 = E.e0.m;
  final fe3 = E.e1.m;
  Expect.equals(fe1, fe2);
  Expect.notEquals(fe1, fe3);

  A a = A();
  final fa1 = a.m;
  final fa2 = a.m;
  final fa3 = A().m;
  Expect.equals(fa1, fa2);
  Expect.notEquals(fa1, fa3);

  ET et = ET(0);
  final fet1 = et.m;
  final fet2 = et.m;
  final fet3 = ET(0).m;
  Expect.equals(fet1, fet2);
  Expect.notEquals(fet1, fet3);
}
