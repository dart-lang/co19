// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `M` be the set of accessible extensions with on-declaration
/// `D` that declare a constructor with uniform base constructor name `name` or
/// a static member with basename `name`.
/// ...
/// Otherwise, `M` only includes extensions containing constructors with the
/// requested name. A compile-time error occurs if `M` is empty, or `M` contains
/// two or more elements. Otherwise, the invocation or reference denotes an
/// invocation of or reference to the constructor with uniform base constructor
/// name `name` which is declared by the extension declaration that `M`
/// contains.
///
/// @description Library containing declarations and extensions with
/// constructors. Used by the tests that check constructor invocations and
/// tearoffs of the form `prefix.C<TypeArguments>.name`.
/// @author sgrekhov22@gmail.com

class C<X> {
  final String id;
  C._(this.id);
  Type get t => X;
}

mixin M<X> {
  String get id;
  Type get t => X;
}

class MO<X> with M<X> {
  final String id;
  MO._(this.id);
}

mixin class MC<X> {
  String id = "";
  MC._();
  Type get t => X;
}

enum E<X> {
  e0<int>._(),
  e1<String>._();

  const E._();
}

extension type ET<X>._(String id) {
  Type get t => X;
}

extension ExtC<T> on C<T> {
  factory named(String id) => C<T>._("ExtC.named($id)");
  factory(String id) => C<T>._("ExtC($id)");
}

extension ExtM<T> on M<T> {
  factory named(String id) => MO<T>._("ExtM.named($id)");
  factory(String id) => MO<T>._("ExtM($id)");
}

extension ExtMC<T> on MC<T> {
  factory named(String id) => MC<T>._()..id = "ExtMC.named($id)";
  factory(String id) => MC<T>._()..id = "ExtMC($id)";
}

extension ExtE<T> on E<T> {
  factory named() => E.e0 as E<T>;
  factory() => E.e1 as E<T>;
}

extension ExtET<T> on ET<T> {
  factory named(String id) => ET<T>._("ExtET.named($id)");
  factory(String id) => ET<T>._("ExtET($id)");
}

extension ExtC1<T> on C<T> {
  factory amb() => C<T>._("ExtC1.amb");
  static String conflict() => "ExtC1.conflict()";
}

extension ExtC2<T> on C<T> {
  factory amb() => C<T>._("ExtC2.amb");
  factory conflict() => C<T>._("ExtC2.conflict");
}

extension ExtM1<T> on M<T> {
  factory amb() => MO<T>._("ExtM1.amb");
  static String conflict() => "ExtM1.conflict()";
}

extension ExtM2<T> on M<T> {
  factory amb() => MO<T>._("ExtM2.amb");
  factory conflict() => MO<T>._("ExtM2.conflict");
}

extension ExtMC1<T> on MC<T> {
  factory amb() => MC<T>._()..id = "ExtMC1.amb";
  static String conflict() => "ExtMC1.conflict()";
}

extension ExtMC2<T> on MC<T> {
  factory amb() => MC<T>._()..id = "ExtMC2.amb";
  factory conflict() => MC<T>._()..id = "ExtMC2.conflict";
}

extension ExtE1<T> on E<T> {
  factory amb() => E.e0 as E<T>;
  static String conflict() => "ExtE1.conflict()";
}

extension ExtE2<T> on E<T> {
  factory amb() => E.e0 as E<T>;
  factory conflict() => E.e0 as E<T>;
}

extension ExtET1<T> on ET<T> {
  factory amb() => ET<T>._("ExtET1.amb");
  static String conflict() => "ExtET1.conflict()";
}

extension ExtET2<T> on ET<T> {
  factory amb() => ET<T>._("ExtET2.amb");
  factory conflict() => ET<T>._("ExtET2.conflict");
}
