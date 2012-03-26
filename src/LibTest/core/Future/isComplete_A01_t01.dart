/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool get isComplete()
 * Whether the future is complete (either the value is available or there was an exception).
 * @description Checks that [isComplete] returns the correct value.
 * @author msyabro
 * @reviewer kaigorodov
 */

checkCompleter(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  Expect.isFalse(f.isComplete);
  completer.complete(value);
  Expect.isTrue(f.isComplete);
}

checkConstructor(value) {
  Future f = new Future.immediate(value);
  Expect.isTrue(f.isComplete);
}

checkException(value) {
  Completer completer = new Completer();
  Future f = completer.future;
  Expect.isFalse(f.isComplete);
  completer.completeException(value);
  Expect.isTrue(f.isComplete);
}

main() {
  checkCompleter(1);
  checkCompleter(null);
  checkCompleter([]);

  checkConstructor('value');
  checkConstructor(() => 1);
  checkConstructor({});

  checkException(new Object());
  checkException(new NullPointerException());
  checkException(false);
}