/*
 * Copyright (c) 2011-2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Isolate> spawnUri(Uri uri,
 *                                     List<String> args,
 *                                     message,
 *                                     { bool paused: false,
 *                                       SendPort onExit,
 *                                       SendPort onError,
 *                                       bool errorsAreFatal,
 *                                       bool checked,
 *                                       Map<String, String> environment,
 *                                       Uri packageRoot,
 *                                       Uri packageConfig,
 *                                       bool automaticPackageResolution: false
 *                                     }
 *                                    )
 *     Creates and spawns an isolate that runs the code from the library with
 *  the specified URI.
 *     The isolate starts executing the top-level main function of the library
 *  with the given URI.
 *     The target main must be callable with zero, one or two arguments.
 *  Examples:
 *   main()
 *   main(args)
 *   main(args, message)
 *     When present, the parameter args is set to the provided args list. When
 *  present, the parameter message is set to the initial message.
 *
 * @description Checks that sending multiple messages works fine.
 *
 * @author kaigorodov
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

void main0() {
  var receivePort = new ReceivePort();
  SendPort sendPort;
  int n = 10;
  
  asyncStart();
  receivePort.listen((var message) {
    if (message is SendPort) {
      sendPort=message;
    } else {
      Expect.equals(n, message);
    }
    if (n > 0) {
      n--;
      sendPort.send(n);
    } else {
      receivePort.close();
      asyncEnd();
    }
  });
  Isolate.spawnUri(
      new Uri.file("spawnUri_A01_t05.dart"),
      [(n - 1).toString()],
      receivePort.sendPort
  );
}

void main(List args, SendPort replyPort) {
  if (replyPort == null) {
    main0();
    return;
  } 
  var receivePort = new ReceivePort();
  receivePort.listen((var message) {
    replyPort.send(message);
    if (message == 0) {
      receivePort.close();
    }
  });
  replyPort.send(receivePort.sendPort);
}
