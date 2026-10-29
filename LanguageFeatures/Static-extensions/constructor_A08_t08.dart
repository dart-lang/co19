// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a redirecting factory constructor
/// declared in an extension has a redirection target which is not a subtype of
/// the un-instantiated on-type of the extension (after inference has been
/// performed).
///
/// In addition, all of the usual compile-time errors associated with
/// declarations of redirecting factory constructors continue to apply.
///
/// @description Checks that it is a compile-time error if a formal parameter of
/// the redirection target of a redirecting factory constructor declared in an
/// extension has a default value whose type is not a subtype of the type of the
/// corresponding formal parameter of the redirecting constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<T> {
  C([Object? v = "s"]);
  C.named({Object? v = "s"});
}

mixin M<T> {}

class MO<T> with M<T> {
  MO([Object? v = "s"]);
  MO.named({Object? v = "s"});
}

mixin class MC<T> {
  MC([Object? v = "s"]);
  MC.named({Object? v = "s"});
}

extension type ET<T>(int _) {
  ET.opt([Object? v = "s"]) : this(0);
  ET.named({Object? v = "s"}) : this(0);
}

enum E<T> {
  e0<Never>();

  const E();
  factory E.opt([Object? v = "s"]) => e0;
  factory E.named({Object? v = "s"}) => e0;
}

extension ExtC<T> on C<T> {
  factory foo1([int v]) = C<T>.new;
//                        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2({int v}) = C<T>.named;
//                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM<T> on M<T> {
  factory foo1([int v]) = MO<T>.new;
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2({int v}) = MO<T>.named;
//                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  factory foo1([int v]) = MC<T>.new;
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2({int v}) = MC<T>.named;
//                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET<T> on ET<T> {
  factory foo1([int v]) = ET<T>.opt;
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2({int v}) = ET<T>.named;
//                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtE<T> on E<T> {
  factory foo1([int v]) = E<T>.opt;
//                        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2({int v}) = E<T>.named;
//                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(MC);
  print(ET);
  print(E);
}
