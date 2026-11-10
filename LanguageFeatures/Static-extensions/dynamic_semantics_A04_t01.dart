// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Invocations of redirecting factory constructors defined in
/// extensions (including const invocations) are evaluated by evaluating an
/// invocation of the underlying redirectee, with type arguments as provided by
/// type inference, and term arguments as taken from the declaration of the
/// enclosing constructor as usual.
///
/// @description Checks that an invocation of a redirecting factory constructor
/// declared in an extension is evaluated as an invocation of the redirectee
/// with the type arguments provided by type inference and with the arguments of
/// the invocation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C<X, Y> {
  final Object? v;
  C._(this.v);
  C.named({this.v});
  Type get tx => X;
  Type get ty => Y;
}

mixin M<X, Y> {
  Object? get v;
  Type get tx => X;
  Type get ty => Y;
}

class MO<X, Y> with M<X, Y> {
  final Object? v;
  MO._(this.v);
  MO.named({this.v});
}

mixin class MC<X, Y> {
  Object? v;
  MC._();
  factory MC.make(Object? v) => MC._()..v = v;
  factory MC.named({Object? v}) => MC._()..v = v;
  Type get tx => X;
  Type get ty => Y;
}

extension ExtC<T> on C<T, T> {
  factory r(List<T> v) = C<T, T>._;
  factory n({List<T> v}) = C<T, T>.named;
}

extension ExtM<T> on M<T, T> {
  factory r(List<T> v) = MO<T, T>._;
  factory n({List<T> v}) = MO<T, T>.named;
}

extension ExtMC<T> on MC<T, T> {
  factory r(List<T> v) = MC<T, T>.make;
  factory n({List<T> v}) = MC<T, T>.named;
}

main() {
  var cl1 = <int>[1];
  var c1 = C.r(cl1);
  Expect.identical(cl1, c1.v);
  Expect.equals(int, c1.tx);
  Expect.equals(int, c1.ty);
  var cl2 = <int>[2];
  var c2 = C.n(v: cl2);
  Expect.identical(cl2, c2.v);
  Expect.equals(int, c2.tx);
  Expect.equals(int, c2.ty);
  C<num, num> c3 = C.r([3]);
  Expect.listEquals([3], c3.v as List);
  Expect.equals(num, c3.tx);
  Expect.equals(num, c3.ty);
  var c4 = C<num, int>.r([4]);
  Expect.equals(int, c4.tx);
  Expect.equals(int, c4.ty);
  var c5 = ExtC<num>.n(v: [5]);
  Expect.listEquals([5], c5.v as List);
  Expect.equals(num, c5.tx);
  Expect.equals(num, c5.ty);
  var c6 = C.n();
  Expect.isNull(c6.v);
  Expect.equals(dynamic, c6.tx);

  var ml1 = <int>[1];
  var m1 = M.r(ml1);
  Expect.identical(ml1, m1.v);
  Expect.equals(int, m1.tx);
  Expect.equals(int, m1.ty);
  var ml2 = <int>[2];
  var m2 = M.n(v: ml2);
  Expect.identical(ml2, m2.v);
  Expect.equals(int, m2.tx);
  Expect.equals(int, m2.ty);
  M<num, num> m3 = M.r([3]);
  Expect.listEquals([3], m3.v as List);
  Expect.equals(num, m3.tx);
  Expect.equals(num, m3.ty);
  var m4 = M<num, int>.r([4]);
  Expect.equals(int, m4.tx);
  Expect.equals(int, m4.ty);
  var m5 = ExtM<num>.n(v: [5]);
  Expect.listEquals([5], m5.v as List);
  Expect.equals(num, m5.tx);
  Expect.equals(num, m5.ty);
  var m6 = M.n();
  Expect.isNull(m6.v);
  Expect.equals(dynamic, m6.tx);

  var mcl1 = <int>[1];
  var mc1 = MC.r(mcl1);
  Expect.identical(mcl1, mc1.v);
  Expect.equals(int, mc1.tx);
  Expect.equals(int, mc1.ty);
  var mcl2 = <int>[2];
  var mc2 = MC.n(v: mcl2);
  Expect.identical(mcl2, mc2.v);
  Expect.equals(int, mc2.tx);
  Expect.equals(int, mc2.ty);
  MC<num, num> mc3 = MC.r([3]);
  Expect.listEquals([3], mc3.v as List);
  Expect.equals(num, mc3.tx);
  Expect.equals(num, mc3.ty);
  var mc4 = MC<num, int>.r([4]);
  Expect.equals(int, mc4.tx);
  Expect.equals(int, mc4.ty);
  var mc5 = ExtMC<num>.n(v: [5]);
  Expect.listEquals([5], mc5.v as List);
  Expect.equals(num, mc5.tx);
  Expect.equals(num, mc5.ty);
  var mc6 = MC.n();
  Expect.isNull(mc6.v);
  Expect.equals(dynamic, mc6.tx);
}
