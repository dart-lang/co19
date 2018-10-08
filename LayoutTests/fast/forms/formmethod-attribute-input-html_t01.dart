/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for the formmethod attribute in input tags.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <form method="get" action="?">
          <input type="hidden" name="hidden" value="I am hidden" />
          <input id="button" formmethod="post" type="submit" name="button" />
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var url = window.location.href;
  var button = document.getElementById('button');

  var firstRun = url.indexOf('?') == -1 ||
    url.substring(url.indexOf('?')+1, url.length) != "";

  if (firstRun) {
    button.click();
  } else {
    shouldBe(url.substring(url.indexOf('?')+1, url.length), "");
  }
}
