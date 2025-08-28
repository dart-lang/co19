// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion switch statement: If `N` is a switch statement of the form
/// `switch (E) {alternatives}` (where each `alternative` is a
/// `switchStatementDefault` or `switchStatementCase` construct), then:
/// - Let `before(E) = before(N)`.
/// - Let `unmatched = split(after(E))`. Note: the name `unmatched` was chosen
///   because a future update is planned that will add support for patterns; in
///   this update, `unmatched` will model the program's state in the event that
///   the value of `E` has failed to match all of the alternatives seen so far.
/// - Let `r` be the reachability stack of `unmatched`.
/// - Collect the `alternatives` into groups, where each alternative is in the
///   same group as the following one iff its statement list is empty. This
///   grouping has the property that if any alternative matches, the set of
///   statements that will be executed is the last set of statements in the
///   group.
/// - For each group `G` in `body`:
///   - Let `S` be the set of statements in the last alternative of `G`.
///   - Let `before(S)` be defined as follows:
///     - If any of the alternatives in `G` contains a label, then
///       `before(S) = split(conservativeJoin(unmatched, assignedIn(N), capturedIn(N)))`.
///     - Otherwise, let `before(S) = split(unmatched)`.
/// - Let `breakModels` be a list consisting of:
///   - For each group `G` in `body`:
///     - For each `break` statement `B` in `G` that targets `N`:
///       - `unsplitTo(r, before(B))`.
///     - If `after(S)` is locally reachable (where `S` be the set of statements
///       in the last alternative of `G`):
///       - `unsplit(after(S))`.
///   - If `N` does not contain a `default`: clause, and the static type of `E`
///     is not an always-exhaustive type:
///     - `unmatched`
/// - Let `after(N)` be defined as follows:
///   - If `breakModels` is an empty list, let
///     `after(N) = unreachable(after(E))`.
///   - Otherwise, let `after(N) = unsplit(join(...breakModels))`
///
/// @description Checks that if `E` has type `Never` then all `alternatives` are
/// unreachable.
/// @author sgrekhov22@gmail.com

Never foo() => throw "Never";

void test1() {
  late int i;
  if (2 > 1) {
    switch (foo()) {
      case 1:
        i = 42;
      default:
        i = 42;
    }
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test2(Never n) {
  late int i;
  if (2 > 1) {
    switch (n) {
      case 1:
        i = 42;
      default:
        i = 42;
    }
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

void test3<T extends Never>(T n) {
  late int i;
  if (2 > 1) {
    switch (n) {
      case 1:
        i = 42;
      default:
        i = 42;
    }
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
