/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String responseText
 * The response in String form or empty String on failure.
 * @description Checks that the property is  empty in case of failure.
 * @needsreview #16757
 */
import "dart:html";
import "../../../Utils/async_utils.dart";
import "../../../UtilsHtml/expect.dart";

main() {
  var request = new HttpRequest();
  request.open('GET', "IntentionallyMissingFile");
  asyncStart();
  request.onError.listen((event){
      Expect.equals(r.status, 404);
      Expect.isNull(r.response);
      Expect.isTrue(r.responseText.length==0);
      asyncEnd();
    });
  request.send();
}
