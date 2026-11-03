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
/// @description Checks that it is a compile-time error if `M` is empty. Test
/// `C.name(arguments)`, `C<TypeArguments>.name(arguments)`, `C(arguments)`,
/// `C<TypeArguments>(arguments)`, `C.new(arguments)` and
/// `C<TypeArguments>.new(arguments)` when the constructors named `name` and
/// `new` are declared only by extensions whose on-declaration is a subtype of
/// `C` (or another declaration).
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
  e0<Never>._();

  const E._();
}

enum E2<X> {
  e0<Never>._();

  const E2._();
}

extension type ET<X>._(String id) {}

extension type ET2<X>._(String id) implements ET<X> {}

extension ExtD<T> on D<T> {
  factory named(String _) => D<T>._();
  factory(String _) => D<T>._();
}

extension ExtMO<T> on MO<T> {
  factory named(String _) => MO<T>._();
  factory(String _) => MO<T>._();
}

extension ExtMCO<T> on MCO<T> {
  factory named(String _) => MCO<T>._();
  factory(String _) => MCO<T>._();
}

extension ExtE2<T> on E2<T> {
  factory named(String _) => E2.e0;
  factory(String _) => E2.e0;
}

extension ExtET2<T> on ET2<T> {
  factory named(String id) => ET2<T>._("ExtET2.named($id)");
  factory(String id) => ET2<T>._("ExtET2($id)");
}

main() {
  C.named("");
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C("");
//^
// [analyzer] unspecified
// [cfe] unspecified

  C.new("");
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.named("");
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>("");
//^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.new("");
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M.named("");
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M("");
//^
// [analyzer] unspecified
// [cfe] unspecified

  M.new("");
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.named("");
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>("");
//^
// [analyzer] unspecified
// [cfe] unspecified

  M<int>.new("");
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC.named("");
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC("");
//^^
// [analyzer] unspecified
// [cfe] unspecified

  MC.new("");
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.named("");
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>("");
//^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int>.new("");
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.named("");
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E("");
//^
// [analyzer] unspecified
// [cfe] unspecified

  E.new("");
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.named("");
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>("");
//^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.new("");
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.named("");
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET("");
//^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.new("");
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.named("");
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>("");
//^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int>.new("");
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
