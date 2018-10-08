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
 * @description Checks that if args is not a List instance, then spawnUri throws
 * an exception.
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

main() {
  dynamic args = "hello";
  asyncStart();
  try {
    Uri uri = new Uri.file("spawnUri_A01_t01_isolate.dart");
    Isolate.spawnUri(uri, args, "world")
      .then(
        (Isolate i) {
          print(i);
          Expect.fail("Isolate.spawnUri('$uri', '$args', 'world') should fail");
        },
        onError: (e) {
          Expect.fail("Future is completed with error: $e");
          asyncEnd();
        }
      );
  } catch (e) {
    print("Caught an error: $e");
    asyncEnd();
  }
}

