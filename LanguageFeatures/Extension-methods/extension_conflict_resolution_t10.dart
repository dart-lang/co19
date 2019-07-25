/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If more than one extension applies to a specific member
 * invocation, then we resort to a heuristic to choose one of the extensions to
 * apply. If exactly one of them is "more specific" than all the others, that
 * one is chosen. Otherwise it is a compile-time error.
 *
 * An extension with [on] type clause [T1] is more specific than another
 * extension with [on] type clause [T2] iff
 *
 *   1. The latter extension is declared in a platform library, and the former
 *      extension is not
 *   2. they are both declared in platform libraries or both declared in
 *      non-platform libraries, and
 *   3. the instantiated type (the type after applying type inference from the
 *      receiver) of [T1] is a subtype of the instantiated type of [T2] and
 *      either
 *   4. not vice versa, or
 *   5. the instantiate-to-bounds type of [T1] is a subtype of the
 *      instantiate-to-bounds type of [T2] and not vice versa.
 * @description Check that:
 * For [x.best()], the most specific one is [BestList]. Because [List<int>] is a
 * proper subtype of both [iterable<int>] and [<List<num>], we expect BestList
 * to be the best implementation. The return type causes [v] to have type [int].
 * If we had chosen [BestSpec] instead, the return type could only be [num],
 * which is one of the reasons why we choose the most specific instantiated type
 * as the winner.
 * For [y.best()], the most specific extension is [BestSpec]. The instantiated
 * on types that are compared are [Iterable<num>] for [BestCom] and [List<num>]
 * for the two other. Using the instantiate-to-bounds types as tie-breaker, we
 * find that [List<Object>] is less precise than [List<num>], so the code of
 * [BestSpec] has more precise information available for its method
 * implementation. The type of [w] becomes [num].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

extension BestCom<T extends num> on Iterable<T> {
  T best() { throw null; }
}
extension BestList<T> on List<T> {
  T best() { return(null); }
}

extension BestSpec on List<num> {
  num best() { return(0); }
}

main() {
  List<int> x = [1, 2, 3];
  Expect.isNull(x.best());
  List<num> y = [1, 2, 3];
  Expect.equals(0, y.best());
}
