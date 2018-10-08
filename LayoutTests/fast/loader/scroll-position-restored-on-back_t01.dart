/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 */
import "dart:html";
import "../../testharness.dart";

String resources = "$testSuiteRoot/fast/loader/resources";

const String htmlEL2 = r'''
    <div id="result">Fail. The scroll position was not restored after navigation.</div><br/><br/>
    <div style="width:600; height:1000; background-color:purple;"></div>
''';

void navigate(e) {
    if (window.location.hash == "") {
        window.scrollTo(0,100);
        window.history.pushState({ }, "", "${window.location}#1");
        runLater((){window.location.href = '$resources/empty-document-goes-back.html';}, 0);
        return;
    }

    runLater(() {
        var scrollPosition = document.body.scrollTop;
        var result = document.getElementById("result");
        Expect.equals(100, scrollPosition);
        result.innerHtml = "Success! The scroll position was restored after navigation.";
        asyncEnd();
    }, 0);
}

void main() {
    document.body.setAttribute("style", "width:800px");
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    window.onPageShow.listen(navigate);
}
