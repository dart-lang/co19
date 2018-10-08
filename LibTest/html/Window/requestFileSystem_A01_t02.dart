/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<FileSystem> requestFileSystem(int size, {bool persistent:
 * false})
 * Access a sandboxed file system of the specified size. If persistent is true,
 * the application will request permission from the user to create lasting
 * storage. This storage cannot be freed without the user's permission.
 * Returns a Future whose value stores a reference to the sandboxed file system
 * for use. Because the file system is sandboxed, applications cannot access
 * file systems created in other web pages.
 * @description Checks that FileSystem is not accessible outside its web-page,
 * and a Directory can be created.
 * todo is it in other page?
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  Window nw = window;

  asyncStart();
  nw.requestFileSystem(10).then((FileSystem fs) {
    fs.root.createDirectory("abc").then((Entry entry) {
      Expect.isTrue(entry.isDirectory);
      asyncEnd();
    }, onError: (e) {
      asyncEnd();
      Expect.fail("createDirectory:$e");
    });
  }, onError: (e) {
    asyncEnd();
    Expect.fail("requestFileSystem:$e");
  });
}
