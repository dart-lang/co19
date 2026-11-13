// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a fully resolved reference ("tearoff") of a constructor
/// declared in an extension of the form `E.name` or `E<TypeArguments>.name`. We
/// say that the "un-instantiated function type" of the constructor reference is
/// `M Function(Signature)` where `M` is the un-instantiated on-type of the
/// extension, and `Signature` is the parameter signature of the constructor
/// (that is, the types of the positional parameters, and the types and names of
/// the named parameters). Note that any type parameters declared by the
/// extension occur free in the un-instantiated function type of the
/// constructor. In the case that the extension declares type parameters
/// `TypeParameters`, we further say that the "fully generic function type" of
/// the constructor reference is `M Function<TypeParameters>(Signature)`.
///
/// A fully resolved tearoff with no type arguments (`E.name`) which refers to a
/// constructor declared in an extension where the extension declares no type
/// parameters, is subject to no further inference to reconstruct the type
/// arguments.
///
/// The static type of such a tearoff is the un-instantiated function type of
/// the constructor reference.
///
/// @description Checks that if `E` is not generic, then the static type of the
/// tearoff `E.name` is the un-instantiated function type of the constructor
/// reference.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

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

extension ExtC2 on C<int, String> {
  factory foo() => C<int, String>._(int);
}

extension ExtM2 on M<int, String> {
  factory foo() => MO<int, String>._(int);
}

extension ExtMC2 on MC<int, String> {
  factory foo() => MC<int, String>._()..t = int;
}

extension ExtET2 on ET<int, String> {
  factory foo() => ET<int, String>._(int);
}

main() {
  // `ExtC2` is not generic, so the static type is the un-instantiated function
  // type `C<int, String> Function()`.
  var cf1 = ExtC2.foo;
  cf1.expectStaticType<Exactly<C<int, String> Function()>>();
  Expect.equals(int, cf1().t);
  // The tearoff is not generic, so there is nothing to infer from the context
  // type. The type of the tearoff is a subtype of the context type.
  C<Object, Object> Function() cf2 = ExtC2.foo;
  Expect.equals(int, cf2().t);

  var mf1 = ExtM2.foo;
  mf1.expectStaticType<Exactly<M<int, String> Function()>>();
  Expect.equals(int, mf1().t);
  M<Object, Object> Function() mf2 = ExtM2.foo;
  Expect.equals(int, mf2().t);

  var mcf1 = ExtMC2.foo;
  mcf1.expectStaticType<Exactly<MC<int, String> Function()>>();
  Expect.equals(int, mcf1().t);
  MC<Object, Object> Function() mcf2 = ExtMC2.foo;
  Expect.equals(int, mcf2().t);

  var etf1 = ExtET2.foo;
  etf1.expectStaticType<Exactly<ET<int, String> Function()>>();
  Expect.equals(int, etf1().t);
  ET<Object, Object> Function() etf2 = ExtET2.foo;
  Expect.equals(int, etf2().t);
}
