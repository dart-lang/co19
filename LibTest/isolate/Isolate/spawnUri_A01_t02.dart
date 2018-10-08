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
 * @description Checks spawning 3 isolates from a single source.
 *
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

class Connection {
  String expectedMessage;
  var receivePort = new ReceivePort();

  Connection(int n) {
    expectedMessage = "spawnUri_A01_t01:$n";
    receivePort.listen(receiveHandler);
  }
  
  void start() {
    asyncStart();
    Isolate.spawnUri(
        new Uri.file("spawnUri_A01_t01_isolate.dart"),
        [expectedMessage],
        receivePort.sendPort
    );
  }
  
  void receiveHandler(var message) {
    Expect.equals(expectedMessage, message);
    receivePort.close();
    asyncEnd();
  }
}

main() {
  for (int k = 0; k < 3; k++) {
    Connection conn = new Connection(k);
    conn.start();
  }
}
