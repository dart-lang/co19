// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion do while statement: If `N` is a do while statement of the form
/// `do S while (E)` then:
/// - Let `before(S) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// - Let `before(E) = join(after(S), continue(N))`
/// - Let `after(N) = join(false(E), break(S))`
///
/// @description Checks that `before(E) = join(after(S), continue(N))`. Test
/// that if `S` breaks then an assignment in `E` is treated as
/// 'probably assigned'.
/// @author sgrekhov22@gmail.com
/// @issue 60361

main() {
  late int i;
  do {
    break;
  } while ((i = 42) < 0); // Probably assigned. https://github.com/dart-lang/sdk/issues/42232#issuecomment-690681385
  i; // Not definitely unassigned
}
