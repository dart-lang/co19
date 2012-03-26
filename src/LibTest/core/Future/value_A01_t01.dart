/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T get value()
 * The value this future provided.
 * (If called when hasValue is false, then throws an exception.)
 * @description Checks that if this getter is called when a future has a value,
 * the correct value is returned.
 * @author msyabro
 * @reviewer kaigorodov
 */

checkCompleter(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  completer.complete(value);
  Expect.equals(value, f.value);
}

checkConstructor(value) {
  Future f = new Future.immediate(value);
  Expect.equals(value, f.value);
}

main() {
  checkCompleter(null);
  checkCompleter(25);
  checkCompleter("String");
  checkCompleter(true);

  checkConstructor(null);
  checkConstructor('');
  checkConstructor(false);
  checkConstructor(-0.879);
}