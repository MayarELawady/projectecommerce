const functions = require('firebase-functions');

const admin = require('firebase-admin');

admin.initializeApp();

exports.Function = functions.firestore.document('Customer Notifications/{docID}').onCreate(
    (snapshot, context) => {
        return admin.messaging().sendToTopic('VendorNotfication',
        {
            notification : {
                title : "New seats reserved !",
                body : "a user reserved new seats, view it now.",
                clickAction : 'FLUTTER_NOTIFICATION_CLICK'
            }
        }
        );
    }
);
