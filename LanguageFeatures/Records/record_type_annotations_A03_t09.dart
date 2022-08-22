// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a record type has any of:
///
/// The same field name more than once.
///
/// No named fields and only one positional field. This isn't ambiguous, since
/// there are no parenthesized type expressions in Dart. But there is no reason
/// to allow single positional element record types when the corresponding
/// record values are prohibited.
///
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// @description Checks that optional name of a positional field may include
/// `hashCode`, `runtimeType`, `noSuchMethod`, and `toString`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

typedef R1 = (String hashCode, int runtimeType, Function noSuchMethod,
    String toString);

typedef (int hashCode, Type runtimeType, Function noSuchMethod,
    String toString) R2();

typedef void R3((int hashCode, Type runtimeType, Function noSuchMethod,
    String toString));

(int? hashCode, Type? runtimeType, Function? noSuchMethod, String? toString)
    foo() => (null, null, null, null);

void bar((int hashCode, Type runtimeType, Function noSuchMethod,
    String toString)) {}

main() {
  (int? hashCode, Type? runtimeType, Function? noSuchMethod, String? toString)
      r1 = (null, null, null, null);

  dynamic d = (null, null, null, null);
  if (d is (int? hashCode, Type? runtimeType, Function? noSuchMethod,
      String? toString)) {
  }

  d as (int? hashCode, Type? runtimeType, Function? noSuchMethod,
      String? toString);

  print(R1);
  print(R2);
  print(R3);
  print(foo);
  print(bar);
}
