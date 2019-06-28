/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
library scope_all_lib;

extension Foo<T> on List<T> {
  String foo() => "foo";
  static String staticFoo = "staticFoo";
}

extension Bar<T> on List<T> {
  String bar() => "bar";
  static String staticBar = "staticBar";
}

extension Baz<T> on List<T> {
  String baz() => "baz";
  static String staticBaz = "staticBaz";
}
