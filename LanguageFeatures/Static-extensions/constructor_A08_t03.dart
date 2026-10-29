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
/// @description Checks that it is a compile-time error if a redirecting factory
/// constructor declared in an extension specifies a default value for any of
/// its formal parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<T> {
  C([int v = 0]);
  C.named({int v = 0});
}

mixin M<T> {}

class MO<T> with M<T> {
  MO([int v = 0]);
  MO.named({int v = 0});
}

mixin class MC<T> {
  MC._();
  factory MC([int v = 0]) => MC<T>._();
  factory MC.named({int v = 0}) => MC<T>._();
}

extension type ET<T>(int _) {
  ET.opt([int v = 0]) : this(v);
  ET.named({int v = 0}) : this(v);
}

enum E<T> {
  e0<Never>();

  const E();
  factory E.opt([int v = 0]) => e0;
  factory E.named({int v = 0}) => e0;
}

extension ExtC<T> on C<T> {
  factory foo1([int v = 1]) = C<T>.new;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2({int v = 1}) = C<T>.named;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM<T> on M<T> {
  factory foo1([int v = 1]) = MO<T>.new;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2({int v = 1}) = MO<T>.named;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  factory foo1([int v = 1]) = MC<T>.new;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2({int v = 1}) = MC<T>.named;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET<T> on ET<T> {
  factory foo1([int v = 1]) = ET<T>.opt;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2({int v = 1}) = ET<T>.named;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtE<T> on E<T> {
  factory foo1([int v = 1]) = E<T>.opt;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  factory foo2({int v = 1}) = E<T>.named;
//                      ^
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
