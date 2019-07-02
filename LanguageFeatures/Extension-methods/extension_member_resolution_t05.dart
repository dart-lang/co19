/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For generic extensions, standard type inference is used to infer
 * the type arguments
 *
 * @description Check that for generic extensions, standard type inference is
 * used to infer the type arguments
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class A {}
class B {}
class C extends A {}

extension ExtA<T extends A> on List<T> {
  String method() => "ExtA method";
}

extension ExtC<T extends C> on List<T> {
  String method() => "ExtC method";
}

main() {
  List<B> list = [new B(), new B()];
  list.method();
}
