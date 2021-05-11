// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With sound null safety, all generic const constructors and
/// generic const literals are evaluated using the actual type arguments
/// provided, whether legacy or non-legacy. This ensures that with sound null
/// safety, the final consistent semantics are obeyed.
///
/// @description Checks dynamically that actual generic class type parameter is
/// evaluated correctly for [Never] type argument in weak mode.
///
/// This is a question about constant evaluation, and the distinction between
/// sound and unsound null checking pops up: The null safety spec says that with
/// unsound null checking, `const C<Never>()` should treat `Never` as if it were
/// a legacy type. https://github.com/dart-lang/language/issues/1346 is all about
/// this, and we can't resolve that question as long as 1346 hasn't been
/// resolved.
///
/// One proposal says that in unsound checking mode, `const C<Never>()` means
/// `const C<Null>()`, so the type argument will be unequal to `Never`. Another
/// one is that we should add `*` to types and leave `Never` in opted-in code
/// unchanged, so we'd compare `Never` and `Never*`, which would yield true
/// (according to the run-time semantics of `operator ==` on instances of `Type`
/// that reify types).
///
/// So we'll have to keep this one on a waiting list, blocked by 1346 (or some
/// issue that can be found looking at 1346, if the discussion is taken somewhere
/// else, say https://github.com/dart-lang/sdk/issues/44246).
///
/// @Issue 39678
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "../../../Utils/expect.dart";

class A<T> {
  const A();
  void testme() { Expect.equals(Never, T); }
}

main() {
  const a = A<Never>();
  a.testme();
}
