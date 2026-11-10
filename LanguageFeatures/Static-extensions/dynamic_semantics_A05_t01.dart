// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Tearoffs of fully resolved constructors are treated as tearoffs
/// of a static member as defined above. If the extension (and hence the induced
/// static member representing the constructor) is generic, then type arguments
/// to the reference may be present coercing it from a generic member to a
/// non-generic member in the usual manner. These type arguments may be taken
/// from the original invocation if provided explicitly (`E<Types>.name`) or as
/// reconstructed via inference in the manner described above if not provided
/// explicitly (`E.name`). If the constructor is generic and no such coercion is
/// present, then the reference evaluates to a reference to a generic static
/// member as described above.
///
/// @description Checks that a tearoff of a constructor declared in a generic
/// extension evaluates to a generic function if no type arguments are provided
/// or inferred, and to a non-generic function with the given or inferred type
/// arguments otherwise. Test that tearoffs of the same constructor with the
/// same type arguments are equal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C<X, Y> {
  final Type t;
  C._(this.t);
}

mixin M<X, Y> {
  Type get t;
}

class MO<X, Y> with M<X, Y> {
  final Type t;
  MO._(this.t);
}

mixin class MC<X, Y> {
  Type t = Null;
  MC._();
}

extension type ET<X, Y>._(Type t) {}

extension ExtC<T> on C<T, T> {
  factory fromList(List<T> _) => C<T, T>._(T);
  factory(List<T> _) => C<T, T>._(T);
}

extension ExtM<T> on M<T, T> {
  factory fromList(List<T> _) => MO<T, T>._(T);
  factory(List<T> _) => MO<T, T>._(T);
}

extension ExtMC<T> on MC<T, T> {
  factory fromList(List<T> _) => MC<T, T>._()..t = T;
  factory(List<T> _) => MC<T, T>._()..t = T;
}

extension ExtET<T> on ET<T, T> {
  factory fromList(List<T> _) => ET<T, T>._(T);
  factory(List<T> _) => ET<T, T>._(T);
}

main() {
  var cf1 = ExtC.fromList;
  Expect.isTrue(cf1 is C<T, T> Function<T>(List<T>));
  Expect.identical(ExtC.fromList, cf1);
  Expect.equals(int, cf1<int>([]).t);
  Expect.equals(dynamic, (cf1 as dynamic)([]).t);
  var cf2 = ExtC<int>.fromList;
  Expect.isTrue(cf2 is C<int, int> Function(List<int>));
  Expect.isFalse(cf2 is C<num, num> Function(List<num>));
  Expect.equals(ExtC<int>.fromList, cf2);
  Expect.equals(int, cf2([]).t);
  C<num, num> Function(List<num>) cf3 = ExtC.new;
  Expect.equals(ExtC<num>.new, cf3);
  Expect.equals(num, cf3([]).t);
  Expect.notEquals(ExtC<num>.fromList, cf3);

  var mf1 = ExtM.fromList;
  Expect.isTrue(mf1 is M<T, T> Function<T>(List<T>));
  Expect.identical(ExtM.fromList, mf1);
  Expect.equals(int, mf1<int>([]).t);
  Expect.equals(dynamic, (mf1 as dynamic)([]).t);
  var mf2 = ExtM<int>.fromList;
  Expect.isTrue(mf2 is M<int, int> Function(List<int>));
  Expect.isFalse(mf2 is M<num, num> Function(List<num>));
  Expect.equals(ExtM<int>.fromList, mf2);
  Expect.equals(int, mf2([]).t);
  M<num, num> Function(List<num>) mf3 = ExtM.new;
  Expect.equals(ExtM<num>.new, mf3);
  Expect.equals(num, mf3([]).t);
  Expect.notEquals(ExtM<num>.fromList, mf3);

  var mcf1 = ExtMC.fromList;
  Expect.isTrue(mcf1 is MC<T, T> Function<T>(List<T>));
  Expect.identical(ExtMC.fromList, mcf1);
  Expect.equals(int, mcf1<int>([]).t);
  Expect.equals(dynamic, (mcf1 as dynamic)([]).t);
  var mcf2 = ExtMC<int>.fromList;
  Expect.isTrue(mcf2 is MC<int, int> Function(List<int>));
  Expect.isFalse(mcf2 is MC<num, num> Function(List<num>));
  Expect.equals(ExtMC<int>.fromList, mcf2);
  Expect.equals(int, mcf2([]).t);
  MC<num, num> Function(List<num>) mcf3 = ExtMC.new;
  Expect.equals(ExtMC<num>.new, mcf3);
  Expect.equals(num, mcf3([]).t);
  Expect.notEquals(ExtMC<num>.fromList, mcf3);

  var etf1 = ExtET.fromList;
  Expect.isTrue(etf1 is ET<T, T> Function<T>(List<T>));
  Expect.identical(ExtET.fromList, etf1);
  Expect.equals(int, etf1<int>([]).t);
  Expect.equals(dynamic, (etf1 as dynamic)([]).t);
  var etf2 = ExtET<int>.fromList;
  Expect.isTrue(etf2 is ET<int, int> Function(List<int>));
  Expect.isFalse(etf2 is ET<num, num> Function(List<num>));
  Expect.equals(ExtET<int>.fromList, etf2);
  Expect.equals(int, etf2([]).t);
  ET<num, num> Function(List<num>) etf3 = ExtET.new;
  Expect.equals(ExtET<num>.new, etf3);
  Expect.equals(num, etf3([]).t);
  Expect.notEquals(ExtET<num>.fromList, etf3);
}
