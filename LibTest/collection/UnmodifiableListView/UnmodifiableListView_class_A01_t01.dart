/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class UnmodifiableListView<E>
 * An unmodifiable [List] view of another [List].
 * The source of the elements may be a [List] or any [Iterable] with efficient
 * [Iterable.length] and [Iterable.elementAt].
 * @description Checks that Iterable-specific methods work as specified.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../core/Iterable/allTests.lib.dart" as iterableTests;

main() {
  // Run tests for methods inherited from Iterable
  Iterable createIterable([Iterable content]) {
    if (content == null) {
      return new UnmodifiableListView([]);
    } else {
      return new UnmodifiableListView(content);
    }
  }
  iterableTests.test(createIterable);
}
