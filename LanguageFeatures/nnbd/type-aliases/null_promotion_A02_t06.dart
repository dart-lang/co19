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
 * @description Check that type of [e] is promoted to [Null] in the [false]
 * condition. Test [e != null] expression. Test pre-NNBD legacy types and type
 * aliases
 * @author sgrekhov@unipro.ru
 * @issue 41494
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-weak
import "legacy_library_aliases_lib.dart" as aliases;

typedef AAlias = aliases.A?;

main() {
  AAlias a = new aliases.A();

  if (a != null) {
  } else {
    a.foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  aliases.AAlias? a2 = aliases.A();
  if (a2 != null) {
  } else {
    a2.bar();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
