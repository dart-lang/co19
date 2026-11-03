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
/// @description Checks that it is a compile-time error if `M` contains two or
/// more elements. Test `C.name`, `C<TypeArguments>.name`, `C.new` and
/// `C<TypeArguments>.new`. Test also that it is an error even if the on-types
/// of the extensions are different instantiations of `C`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X> {
  C._();
}

class D<X> extends C<X> {
  D._() : super._();
}

mixin M<X> {}

class MO<X> with M<X> {
  MO._();
}

mixin class MC<X> {
  MC._();
}

class MCO<X> with MC<X> {
  MCO._();
}

enum E<X> {
  e0<Never>._(),
  e1<Never>._();

  const E._();
}

enum E2<X> {
  e0<Never>._();

  const E2._();
}

extension type ET<X>._(String id) {}

extension type ET2<X>._(String id) implements ET<X> {}

extension ExtC1<T> on C<T> {
  factory named(String _) => C<T>._();
  factory(String _) => C<T>._();
}

extension ExtC2 on C<int> {
  factory named(String _) => C<int>._();
  factory(int _) => C<int>._();
}

extension ExtM1<T> on M<T> {
  factory named(String _) => MO<T>._();
  factory(String _) => MO<T>._();
}

extension ExtM2 on M<int> {
  factory named(String _) => MO<int>._();
  factory(String _) => MO<int>._();
}

extension ExtMC1<T> on MC<T> {
  factory named(String _) => MC<T>._();
  factory(String _) => MC<T>._();
}

extension ExtMC2 on MC<int> {
  factory named(String _) => MC<int>._();
  factory(String _) => MC<int>._();
}

extension ExtE1<T> on E<T> {
  factory named(String _) => E.e0;
  factory(String _) => E.e1;
}

extension ExtE2 on E<int> {
  factory named(String _) => E.e0;
  factory(String _) => E.e1;
}

extension ExtET1<T> on ET<T> {
  factory named(String id) => ET<T>._("ExtET1.named($id)");
  factory(String id) => ET<T>._("ExtET1($id)");
}

extension ExtET2 on ET<int> {
  factory named(String id) => ET<int>._("ExtET2.named($id)");
  factory(String id) => ET<int>._("ExtET2($id)");
}

main() {
  C.named;
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C.new;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.named;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.new;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M.named;
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M.new;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.named;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.new;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC.named;
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC.new;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.named;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.new;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.named;
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.new;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.named;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.new;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.named;
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.new;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.named;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.new;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
