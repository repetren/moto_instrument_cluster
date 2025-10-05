import QtQuick

QtObject {
    property var dictionary: {{}}

    // Open JSON on component load
    Component.onCompleted: {
        var path = "../notificationcode.json" // notification code path
        var xhr = new XMLHttpRequest()
        xhr.open("GET", path)
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                dictionary = JSON.parse(xhr.responseText)

            }
        }
        xhr.send()
    }

    function errorToText(code) {
        return dictionary[String(code)]
    }
}
