/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A check of the form [e != null] or of the form [e is T] where [e]
 * has static type [T?] promotes the type of [e] to [T] in the [true]
 * continuation, and to [Null] in the [false] continuation.
 *
 * @description Check that type of [e] is promoted to [T] in the [false]
 * condition. Test [e != null] expression. Test pre-NNBD legacy types and type
 * aliases
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-weak
import "legacy_library_aliases_lib.dart" as aliases;

typedef AAlias = aliases.A?;

main() {
  AAlias a = new aliases.A();

  if (a != null) {
    a.bar();
    AAlias a1 = a;
  }

  aliases.AAlias? a2 = aliases.A();
  if (a2 != null) {
    a2.bar();
    aliases.AAlias a22 = a2;
  }
}
