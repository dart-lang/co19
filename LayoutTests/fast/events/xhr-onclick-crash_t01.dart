/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test passes if it doesn't crash.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  asyncStart();
  var xhr = new HttpRequest();
  xhr.open('GET', '$root/resources/onclick.html', async:true);
  xhr.responseType = 'document';
  xhr.onLoad.listen((_) {
    var r = xhr.responseXml;
    var td = r.getElementById('foo');
    td.children[0].onClick;
    asyncEnd();
  });
  xhr.send();
}
