/**
 * after web-platform-tests/webstorage/storage_local_setitem_quotaexceedederr.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description storage_local_setItem_QUOTA_EXCEEDED_ERR
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Storage storage=window.localStorage;
    storage.clear();

    var index = 0;
    var key = "name";
    var val = "user";

    assert_throws("QuotaExceededError", () {
        while (true) {
            index++;
            storage["${key}${index}"]="${val}${index}";
        }
    });

    storage.clear();
}