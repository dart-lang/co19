/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that when using the JavaScript bindings to get the value 
 * of a URL attribute such as 'src', leading whitespace is ignored
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var img = new ImageElement();
  var url = "$root/pwd.dart"; // any valid url

  testURL(url)
  {
    img.src = url;
    return img.src;
  }

  shouldBe(testURL(url), url);
  shouldBe(testURL("\\n" + url), url);
  shouldBe(testURL(" " + url), url);
}
