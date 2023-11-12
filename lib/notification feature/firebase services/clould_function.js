
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendBloodRequestNotification = functions.firestore
  .document('Blood Requests/{requestId}')
  .onCreate((snapshot, context) => {
    const requestData = snapshot.data();

    // Check if there are users with matching blood group
    const matchedUsers = admin.firestore().collection('User Data')
      .where('bloodgroup', '==', requestData.bloodGroup)
      .get()
      .then(querySnapshot => {
        querySnapshot.forEach(userDoc => {
          const userId = userDoc.id;

          // Send FCM message to the matched user
          const message = {
            data: {
              title: 'Blood Request',
              body: 'Someone needs your blood type!',
            },
            token: userDoc.data().fcmToken,
          };

          admin.messaging().send(message)
            .then(response => {
              console.log('Successfully sent message:', response);
            })
            .catch(error => {
              console.error('Error sending message:', error);
            });
        });
      })
      .catch(error => {
        console.error('Error fetching matching users:', error);
      });

    return matchedUsers;
  });
