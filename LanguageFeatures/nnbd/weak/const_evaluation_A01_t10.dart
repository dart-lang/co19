// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With sound null safety, all generic const constructors and
/// generic const literals are evaluated using the actual type arguments
/// provided, whether legacy or non-legacy. This ensures that with sound null
/// safety, the final consistent semantics are obeyed.
///
/// @description Checks dynamically that actual generic class type parameter is
/// evaluated correctly for [int?] type argument in weak mode.
///
/// This is a known issue with the common front end: It uses `LEGACY_ERASURE` on
/// type arguments to collection literals and `<constObjectExpression>`, and this
/// eliminates `?` from types (not just top-level, also `List<Object?>` -->
/// `List<Object*>*`). The front end will change to use a different rule, which
/// is currently being debated in
/// https://github.com/dart-lang/language/issues/1346.
///
/// In any case, seems like it's highly unlikely that the rules in the end will
/// erase `?` and make `<Object?>[]` and `<Object>[]` canonicalize to the same
/// object (and this would hold both when the latter occurs in legacy code and
/// when it occurs in code with null safety).
///
/// So issue #39678 with the common front end has been reported here.
/// @Issue 39678,44503
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "../../../Utils/expect.dart";

class A<T> {
  const A();
  void testme() { Expect.equals(typeOf<int?>(), T); }
}

main() {
  const a = A<int?>();
  a.testme();
}
