/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Notice that an explicit override introduces a type context for the
 * object. Example:
 *
 *   extension SymDiff<T> on Set<T> {
 *     Set<T> symmetricDifference(Set<T> other) =>
 *       this.difference(other).union(other.difference(this))
 *   }
 *   ...
 *   SymDiff({}).symmetricDifference(someSet);
 *
 *   Here the inference used to infer type parameters will also affect the
 *   extension receiver "parameter", and make {} a set literal.
 * @description Check that {} is a set literal in the example above.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

extension SymDiff<T> on Set<T> {
  Set<T> symmetricDifference(Set<T> other) =>
    this.difference(other).union(other.difference(this));
}

main() {
  Set someSet = {2};
  Expect.setEquals(someSet, SymDiff({}).symmetricDifference(someSet));
}
