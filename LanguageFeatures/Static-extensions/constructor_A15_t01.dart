// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be the set of accessible extensions with on-declaration
/// `D` that declare a constructor with uniform base constructor name `name` or
/// a static member with basename `name`.
/// ...
/// Let `E` be the unique extension declaration that `M` contains. The fully
/// resolved target of the original invocation or tearoff is then `E.name`.
///
/// @description Checks that if `M` contains exactly one extension `E`, then
/// `C.name`, `C<TypeArguments>.name`, `C.new` and `C<TypeArguments>.new` denote
/// the same constructors as `E.name`, `E<TypeArguments>.name`, `E.new` and
/// `E<TypeArguments>.new` respectively. Test that the corresponding constant
/// tearoffs are identical.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C<X> {
  C._();
}

mixin M<X> {}

class MO<X> with M<X> {
  MO._();
}

mixin class MC<X> {
  MC._();
}

enum E<X> {
  e0<Never>._(),
  e1<Never>._();

  const E._();
}

extension type ET<X>._(int _) {}

extension ExtC<T> on C<T> {
  factory named() => C<T>._();
  factory() => C<T>._();
}

extension ExtM<T> on M<T> {
  factory named() => MO<T>._();
  factory() => MO<T>._();
}

extension ExtMC<T> on MC<T> {
  factory named() => MC<T>._();
  factory() => MC<T>._();
}

extension ExtE<T> on E<T> {
  factory named() => E.e0;
  factory() => E.e1;
}

extension ExtET<T> on ET<T> {
  factory named() => ET<T>._(1);
  factory() => ET<T>._(2);
}

main() {
  const c1 = C.named;
  const extC1 = ExtC.named;
  Expect.identical(extC1, c1);
  const c2 = C.new;
  const extC2 = ExtC.new;
  Expect.identical(extC2, c2);
  const c3 = C<int>.named;
  const extC3 = ExtC<int>.named;
  Expect.identical(extC3, c3);
  const c4 = C<int>.new;
  const extC4 = ExtC<int>.new;
  Expect.identical(extC4, c4);

  const m1 = M.named;
  const extM1 = ExtM.named;
  Expect.identical(extM1, m1);
  const m2 = M.new;
  const extM2 = ExtM.new;
  Expect.identical(extM2, m2);
  const m3 = M<int>.named;
  const extM3 = ExtM<int>.named;
  Expect.identical(extM3, m3);
  const m4 = M<int>.new;
  const extM4 = ExtM<int>.new;
  Expect.identical(extM4, m4);

  const mc1 = MC.named;
  const extMC1 = ExtMC.named;
  Expect.identical(extMC1, mc1);
  const mc2 = MC.new;
  const extMC2 = ExtMC.new;
  Expect.identical(extMC2, mc2);
  const mc3 = MC<int>.named;
  const extMC3 = ExtMC<int>.named;
  Expect.identical(extMC3, mc3);
  const mc4 = MC<int>.new;
  const extMC4 = ExtMC<int>.new;
  Expect.identical(extMC4, mc4);

  const e1 = E.named;
  const extE1 = ExtE.named;
  Expect.identical(extE1, e1);
  const e2 = E.new;
  const extE2 = ExtE.new;
  Expect.identical(extE2, e2);
  const e3 = E<int>.named;
  const extE3 = ExtE<int>.named;
  Expect.identical(extE3, e3);
  const e4 = E<int>.new;
  const extE4 = ExtE<int>.new;
  Expect.identical(extE4, e4);

  const et1 = ET.named;
  const extET1 = ExtET.named;
  Expect.identical(extET1, et1);
  const et2 = ET.new;
  const extET2 = ExtET.new;
  Expect.identical(extET2, et2);
  const et3 = ET<int>.named;
  const extET3 = ExtET<int>.named;
  Expect.identical(extET3, et3);
  const et4 = ET<int>.new;
  const extET4 = ExtET<int>.new;
  Expect.identical(extET4, et4);
}
