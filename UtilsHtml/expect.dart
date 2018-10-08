// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library Expect;
import "dart:html";
import "dart:async";
part "../Utils/expect_common.dart";
part "../Utils/async_utils.dart";

/**
 * Expect is used for tests that do not want to make use of the
 * Dart unit test library - for example, the core language tests.
 * Third parties are discouraged from using this, and should use
 * the expect() function in the unit test library instead for
 * test assertions.
 */
  
 void _fail(String message) {
    UtilsHtml.show("fail: $message");
    throw new ExpectException(message);
 }

class UtilsHtml {

  static String get testTitle {
    return document.title;
  }

  static void show(String msg) {
    print("$msg");
    var llog=document.createElement("div");
    llog.text=msg;
    document.body.append(llog);
  }

  static String relativeUrl(String path) {
    var p = new ParagraphElement();
    var link = new AnchorElement()
    ..href = path
    ..text = path;	
    p.append(link);
    document.body.children.add(p);
    return link.href;
  }
    
}
 