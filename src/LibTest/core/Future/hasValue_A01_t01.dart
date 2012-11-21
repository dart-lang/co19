/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool get hasValue()
 * Whether the value is available (meaning isComplete is true, and there was no exception).
 * @description Checks that [hasValue] returns the correct value.
 * @author msyabro
 * @reviewer kaigorodov
 */

checkCompleter(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  Expect.isFalse(f.hasValue);
  completer.complete(value);
  Expect.isTrue(f.hasValue);
}

checkConstructor(value) {
  Future f = new Future.immediate(value);
  Expect.isTrue(f.hasValue);
}

checkException(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  Expect.isFalse(f.hasValue);
  completer.completeException(value);
  Expect.isFalse(f.hasValue);
}

main() {
  checkCompleter(1);
  checkCompleter(null);
  checkCompleter([]);

  checkConstructor('value');
  checkConstructor(() => 1);
  checkConstructor({});

  checkException(new Object());
  checkException(new Exception());
  checkException(false);
}
