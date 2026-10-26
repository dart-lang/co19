// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declaration is generic, the type parameters
/// declared by the extension are in scope in any constructors declared in the
/// extension (just as with a constructor declared in a generic class).
///
/// @description Checks that the type parameters declared by an extension are in
/// scope in a redirecting factory constructor declared in the extension. Test
/// that it is a compile-time error if the redirection target type is not a
/// subtype of the type of the redirecting constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<T> {
  C(Object? v);
}

mixin M<T> {}

class MO<T> with M<T> {
  MO(Object? v);
}

mixin class MC<T> {
  MC();
  factory MC.named(Object? v) => MC<T>();
}

extension type ET<T>(int _) {
  ET.named(Object? v) : this(0);
}

extension ExtC<T> on C<T> {
  factory foo(T v) = C<String>.new;
//                   ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM<T> on M<T> {
  factory foo(T v) = MO<String>.new;
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  factory foo(T v) = MC<String>.named;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET<T> on ET<T> {
  factory foo(T v) = ET<String>.named;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(MC);
  print(ET);
}
