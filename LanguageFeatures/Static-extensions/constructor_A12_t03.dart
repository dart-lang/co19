// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be the set of accessible extensions with on-declaration
/// `D` that declare a constructor with uniform base constructor name `name` or
/// a static member with basename `name`.
///
/// A compile-time error occurs if `M` includes extensions with constructors as
/// well as static members.
///
/// @description Checks that an extension which declares a static member with
/// the basename `name` is not included in `M` if it is not accessible. Test
/// that in this case there is no compile-time error and `C.name(arguments)`,
/// `C<TypeArguments>.name(arguments)` and `C<TypeArguments>.name` refer to the
/// constructor declared in an accessible extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import 'constructor_A12_lib.dart' hide ExtC2, ExtM2, ExtMC2, ExtE2, ExtET2;

extension ExtC1<T> on C<T> {
  factory foo(String id) => C<T>("ExtC1.foo($id)");
}

extension ExtM1<T> on M<T> {
  factory foo(String id) => MO<T>("ExtM1.foo($id)");
}

extension ExtMC1<T> on MC<T> {
  factory foo(String id) => MC<T>()..id = "ExtMC1.foo($id)";
}

extension ExtE1<T> on E<T> {
  factory foo() => E.e0;
}

extension ExtET1<T> on ET<T> {
  factory foo(int id) => ET<T>(id);
}

main() {
  Expect.equals("ExtC1.foo(1)", C.foo("1").id);
  Expect.equals("ExtC1.foo(2)", C<int>.foo("2").id);
  var fc = C<int>.foo;
  Expect.equals("ExtC1.foo(3)", fc("3").id);

  Expect.equals("ExtM1.foo(1)", (M.foo("1") as MO).id);
  Expect.equals("ExtM1.foo(2)", (M<int>.foo("2") as MO).id);
  var fm = M<int>.foo;
  Expect.equals("ExtM1.foo(3)", (fm("3") as MO).id);

  Expect.equals("ExtMC1.foo(1)", MC.foo("1").id);
  Expect.equals("ExtMC1.foo(2)", MC<int>.foo("2").id);
  var fmc = MC<int>.foo;
  Expect.equals("ExtMC1.foo(3)", fmc("3").id);

  Expect.equals(E.e0, E.foo());
  Expect.equals(E.e0, E<int>.foo());
  var fe = E<int>.foo;
  Expect.equals(E.e0, fe());

  Expect.equals(1, ET.foo(1).id);
  Expect.equals(2, ET<int>.foo(2).id);
  var fet = ET<int>.foo;
  Expect.equals(3, fet(3).id);
}
