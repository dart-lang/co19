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
  (List<int>).filled;           //# 01: compile-time error
  (List.filled)<int>;

  List.filled<int>;             //# 02: compile-time error

  List<int>.filled(4, 4);
  (List<int>).filled(4, 4);     //# 03: compile-time error
  (List.filled)<int>(4, 4);

  List.filled<int>(4, 4);       //# 04: syntax error
}

void testC() {
  C<int>.new;
  (C<int>).new;                 //# 05: compile-time error
  (C.new)<int>;

  C.new<int>;                   //# 06: compile-time error

  C<int>.new();
  (C<int>).new();               //# 07: compile-time error
  (C.new)<int>();

  C.new<int>();                 //# 08: syntax error
}

main() {
  testList();
  testC();
}
