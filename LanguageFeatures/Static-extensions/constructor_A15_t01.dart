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
/// `E<TypeArguments>.new` respectively.
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
  Expect.identical(ExtC.named, C.named);
  Expect.identical(ExtC.new, C.new);
  Expect.identical(ExtC<int>.named, C<int>.named);
  Expect.identical(ExtC<int>.new, C<int>.new);

  Expect.identical(ExtM.named, M.named);
  Expect.identical(ExtM.new, M.new);
  Expect.identical(ExtM<int>.named, M<int>.named);
  Expect.identical(ExtM<int>.new, M<int>.new);

  Expect.identical(ExtMC.named, MC.named);
  Expect.identical(ExtMC.new, MC.new);
  Expect.identical(ExtMC<int>.named, MC<int>.named);
  Expect.identical(ExtMC<int>.new, MC<int>.new);

  Expect.identical(ExtE.named, E.named);
  Expect.identical(ExtE.new, E.new);
  Expect.identical(ExtE<int>.named, E<int>.named);
  Expect.identical(ExtE<int>.new, E<int>.new);

  Expect.identical(ExtET.named, ET.named);
  Expect.identical(ExtET.new, ET.new);
  Expect.identical(ExtET<int>.named, ET<int>.named);
  Expect.identical(ExtET<int>.new, ET<int>.new);
}
