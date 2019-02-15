/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "../../testcommon.dart" as tc;
import "../../testharness.dart";

void crash(e) {
//    document.designMode = "on";
    var textNode = new Text("PASS. WebKit didn't crash.");
    document.body.append(textNode);
    var range = document.createRange();
    range.setStart(textNode, 0);
    document.addEventListener("DOMNodeInserted", (e) {
        if (textNode!=null) {
            textNode.remove();
            print("removed");
        }
        textNode = null;
        print("passed 1");
    }, true);
    try {
        range.insertNode(new Text(""));
    } catch(e) {
        print("catched: $e");
    }
    print("passed");
}

void main() {
    tc.addOnLoadListener((_) {
      crash(_);
    });
}
