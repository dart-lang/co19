/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This test passes if it does not CRASH.
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style>
#el0 { -webkit-columns: 1; } 
#el2:first-of-type { } 
#el2:first-letter { content: counter(c); } 
#el3 { -webkit-column-span: all; content: counter(c) attr(A); } 
</style>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());

    Element el0 = document.createElement('div');
    el0.setAttribute('id', 'el0');
    document.body.append(el0);
    Element el1=document.createElement('b');
    el0.append(el1);
    el1.append(new Text('A'));
    Element el2=document.createElement('div');
    el2.setAttribute('id','el2');
    el0.append(el2);
    Element el3=document.createElement('div');
    el3.setAttribute('id', 'el3');
    el2.append(el3);
//    document.designMode = 'on';
    document.execCommand('selectall', false, null);
    el2.append(new Text('AA'));
//    document.designMode = 'on';
    document.execCommand('selectall', false, null);
    document.execCommand('removeFormat', false, null);

    document.body.appendHtml("PASS. WebKit didn't crash.");
}