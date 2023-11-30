// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<FileSystemEvent> watch({
///  int events: FileSystemEvent.ALL,
///  bool recursive: false
///  })
/// The implementation uses platform-dependent event-based APIs for receiving
/// file-system notifications, thus behavior depends on the platform.
///
/// Windows: Uses ReadDirectoryChangesW. The implementation only supports
/// watching directories. Recursive watching is supported.
/// Linux: Uses inotify. The implementation supports watching both files and
/// directories. Recursive watching is not supported. Note: When watching files
/// directly, delete events might not happen as expected.
/// OS X: Uses FSEvents. The implementation supports watching both files and
/// directories. Recursive watching is supported.
///
/// The system will start listening for events once the returned Stream is being
/// listened to, not when the call to watch is issued.
///
/// The returned value is an endless broadcast Stream, that only stops when one
/// of the following happens:
/// The Stream is canceled, e.g. by calling cancel on the StreamSubscription.
/// The FileSystemEntity being watched, is deleted.
/// System Watcher exits unexpectedly. e.g. On Windows this happens when buffer
/// that receive events from ReadDirectoryChangesW overflows.
/// Use events to specify what events to listen for. The constants in
/// FileSystemEvent can be or'ed together to mix events. Default is
/// FileSystemEvent.ALL.
///
/// A move event may be reported as separate delete and create events.
/// @description Checks that this method watches the FileSystemEntity for
/// changes. Test recursive parameter
/// @author sgrekhov@unipro.ru

import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  if (!Platform.isLinux) {
    await inSandbox(_main);
  }
}

void _main(Directory sandbox) async {
  Directory dir = getTempDirectorySync(parent: sandbox);
  Directory child = dir.createTempSync();

  final eventCompleter = new Completer<FileSystemEvent?>();
  StreamSubscription? subscription;
  asyncStart();
  subscription = dir.watch(events: FileSystemEvent.create,
      recursive: true).listen((FileSystemEvent event) async {
    eventCompleter.complete(event);
    await subscription?.cancel();
    if (event.type != FileSystemEvent.create) {
      Expect.fail("Wrong event arrived");
    } else {
      asyncEnd();
    }
  });
  child.createTempSync();

  await eventCompleter.future
      .timeout(Duration(seconds: eventsTimeout), onTimeout: () async {
    await subscription?.cancel();
    Expect.fail("Watch timed out");
  });
}
