/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Isolate current
 *   Return an Isolate object representing the current isolate.
 *   The current isolate for code using current is the isolate running the code.
 *   The isolate object provides the capabilities required to inspect, pause
 * or kill the isolate, and allows granting these capabilities to others.
 *   It is possible to pause the current isolate, but doing so without first
 * passing the ability to resume it again to another isolate, is a sure way
 * to hang your program.
 *
 * @description Check that current property is not null for new isolate
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

entryPoint(message){
  Expect.isNotNull(Isolate.current);
}

test() async {
  ReceivePort onExit = new ReceivePort();
  ReceivePort onError = new ReceivePort();
  Isolate isolate = await Isolate.spawn(
      entryPoint,
      null, // message
      onExit:onExit.sendPort,
      onError:onError.sendPort,
      errorsAreFatal:true
  );
  await onExit.first;
  onError.close();
  List errors = await onError.toList();
  Expect.isTrue(errors.isEmpty, "Caught unexpected errors: $errors");
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
