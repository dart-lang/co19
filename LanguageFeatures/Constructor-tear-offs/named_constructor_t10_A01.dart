// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This introduces an ambiguity in the grammar. If [List.filled] is
/// a valid expression, then [List.filled(4, 4)] can both be a constructor
/// invocation and a tear-off followed by a function invocation. We only allow
/// the constructor invocation when it's not followed by a typeArguments or
/// arguments production (or, possibly, when it's not followed by a [<] or [(]
/// character). We don't want to allow [List.filled<int>] to be interpreted as
/// [(List.filled)<int>]. Just write the [List<int>.filled] to begin with!
///
/// @description Checks that constructions like [List.filled<int>] are not
/// allowed.
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

class C<T> {
  C() {}
}

void testList() {
  List<int>.filled;
  (List<int>).filled;
  (List.filled)<int>;

  List.filled<int>;
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  List<int>.filled(4, 4);
  (List<int>).filled(4, 4);
  (List.filled)<int>(4, 4);

  List.filled<int>(4, 4);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

void testC() {
  C<int>.ned;
  (C<int>).new;
  (C.new)<int>;

  C.new<int>;
//     ^
// [analyzer] unspecified
// [cfe] unspecified

  C<int>.new();
  (C<int>).new();
  (C.new)<int>();

  C.new<int>();
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  testList();
  testA();
}
