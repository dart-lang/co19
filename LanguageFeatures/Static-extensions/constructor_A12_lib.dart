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
/// @description Library containing extensions which declare static members
/// named `foo`. Used by the tests that check that extensions which are not
/// accessible in the importing library are not included in `M`. The extensions
/// with a public name can be hidden by a `hide` combinator. The extensions with
/// a private name and the unnamed extensions are not imported at all.
/// @author sgrekhov22@gmail.com

// ignore_for_file: unused_element

class C<X> {
  final String id;
  C(this.id);
}

mixin M<X> {}

class MO<X> with M<X> {
  final String id;
  MO(this.id);
}

mixin class MC<X> {
  String id = "";
}

enum E<X> {
  e0<Never>();
}

extension type ET<X>(int id) {}

extension ExtC2 on C {
  static String foo(String id) => "ExtC2.foo($id)";
}

extension _ExtC3 on C {
  static String foo(String id) => "_ExtC3.foo($id)";
}

extension on C {
  static String foo(String id) => "UnnamedC.foo($id)";
}

extension ExtM2 on M {
  static String foo(String id) => "ExtM2.foo($id)";
}

extension _ExtM3 on M {
  static String foo(String id) => "_ExtM3.foo($id)";
}

extension on M {
  static String foo(String id) => "UnnamedM.foo($id)";
}

extension ExtMC2 on MC {
  static String foo(String id) => "ExtMC2.foo($id)";
}

extension _ExtMC3 on MC {
  static String foo(String id) => "_ExtMC3.foo($id)";
}

extension on MC {
  static String foo(String id) => "UnnamedMC.foo($id)";
}

extension ExtE2 on E {
  static String foo() => "ExtE2.foo()";
}

extension _ExtE3 on E {
  static String foo() => "_ExtE3.foo()";
}

extension on E {
  static String foo() => "UnnamedE.foo()";
}

extension ExtET2 on ET {
  static String foo(int id) => "ExtET2.foo($id)";
}

extension _ExtET3 on ET {
  static String foo(int id) => "_ExtET3.foo($id)";
}

extension on ET {
  static String foo(int id) => "UnnamedET.foo($id)";
}
