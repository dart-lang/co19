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
import "../../resources/check-layout.dart";

const String htmlEL2 = r'''
<table height="100%">
    <tbody>
        <tr>
            <td>
                <table class="quirky-box" height="100%" data-offset-y="1">
                    <tbody>
                        <tr>
                            <td style="height: 100px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <div style="height:350px;"></div>
                            </td>
                            <td style="height: 100%; vertical-align: top; width: 100%;">
                                <div>
                                    <table height="100%">
                                        <tbody>
                                            <tr>
                                            <td height="100%" valign="top"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen((e){checkLayout('.quirky-box');});
}
