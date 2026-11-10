// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Every invocation and tearoff of a constructor defined in an
/// extension has a corresponding fully resolved form with all type arguments
/// (if any) fully determined as described in the static semantics above. The
/// dynamic semantics of invocations and tearoffs which are not originally
/// provided in fully resolved form are entirely defined by the dynamic
/// semantics of the corresponding fully resolved form.
///
/// @description Checks that a tearoff of a constructor declared in an
/// extension, which is not in the fully resolved form, evaluates to the same
/// value as the corresponding fully resolved tearoff.
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
  C<num, int> Function(List<int>) cf1 = C.fromList;
  Expect.equals(ExtC<int>.fromList, cf1);
  Expect.notEquals(ExtC<num>.fromList, cf1);
  var cf2 = C<num, int>.fromList;
  Expect.equals(ExtC<int>.fromList, cf2);
  Expect.notEquals(ExtC<num>.fromList, cf2);
  C<num, num> Function(List<num>) cf3 = C.new;
  Expect.equals(ExtC<num>.new, cf3);
  var cf4 = C<Object, num>.new;
  Expect.equals(ExtC<num>.new, cf4);
  Expect.notEquals(ExtC<int>.new, cf4);

  M<num, int> Function(List<int>) mf1 = M.fromList;
  Expect.equals(ExtM<int>.fromList, mf1);
  Expect.notEquals(ExtM<num>.fromList, mf1);
  var mf2 = M<num, int>.fromList;
  Expect.equals(ExtM<int>.fromList, mf2);
  Expect.notEquals(ExtM<num>.fromList, mf2);
  M<num, num> Function(List<num>) mf3 = M.new;
  Expect.equals(ExtM<num>.new, mf3);
  var mf4 = M<Object, num>.new;
  Expect.equals(ExtM<num>.new, mf4);
  Expect.notEquals(ExtM<int>.new, mf4);

  MC<num, int> Function(List<int>) mcf1 = MC.fromList;
  Expect.equals(ExtMC<int>.fromList, mcf1);
  Expect.notEquals(ExtMC<num>.fromList, mcf1);
  var mcf2 = MC<num, int>.fromList;
  Expect.equals(ExtMC<int>.fromList, mcf2);
  Expect.notEquals(ExtMC<num>.fromList, mcf2);
  MC<num, num> Function(List<num>) mcf3 = MC.new;
  Expect.equals(ExtMC<num>.new, mcf3);
  var mcf4 = MC<Object, num>.new;
  Expect.equals(ExtMC<num>.new, mcf4);
  Expect.notEquals(ExtMC<int>.new, mcf4);

  ET<num, int> Function(List<int>) etf1 = ET.fromList;
  Expect.equals(ExtET<int>.fromList, etf1);
  Expect.notEquals(ExtET<num>.fromList, etf1);
  var etf2 = ET<num, int>.fromList;
  Expect.equals(ExtET<int>.fromList, etf2);
  Expect.notEquals(ExtET<num>.fromList, etf2);
  ET<num, num> Function(List<num>) etf3 = ET.new;
  Expect.equals(ExtET<num>.new, etf3);
  var etf4 = ET<Object, num>.new;
  Expect.equals(ExtET<num>.new, etf4);
  Expect.notEquals(ExtET<int>.new, etf4);
}
