/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stops the [Stopwatch]. The [elapsed] count stops increasing. If
 *            the [Stopwatch] is currently not running, then calling stop does
 *            nothing.
 * @description Checks that this method indeed stops the stopwatch.
 * @author rodionov
 * @reviewer pagolubev
 */
 
main() {
  Stopwatch sw = new Stopwatch();
  sw.start();
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      sw.elapsed(); // do something
    }
  }
  sw.stop();
  int e0 = sw.elapsed();
  int ms0 = sw.elapsedInMs();
  int us0 = sw.elapsedInUs();
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      Expect.equals(e0, sw.elapsed(), "elapsed() value changed after stop()");
      Expect.equals(ms0, sw.elapsedInMs(), "elapsedInMs() value changed after stop()");
      Expect.equals(us0, sw.elapsedInUs(), "elapsedInUs() value changed after stop()");
    }
  }
  
  // and again
  sw.start();
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      sw.elapsed(); // do something
    }
  }
  sw.stop();
  e0 = sw.elapsed();
  ms0 = sw.elapsedInMs();
  us0 = sw.elapsedInUs();
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      Expect.equals(e0, sw.elapsed(), "elapsed() value changed after stop()");
      Expect.equals(ms0, sw.elapsedInMs(), "elapsedInMs() value changed after stop()");
      Expect.equals(us0, sw.elapsedInUs(), "elapsedInUs() value changed after stop()");
    }
  }
}
