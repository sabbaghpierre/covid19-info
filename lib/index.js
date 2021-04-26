
 exports.myFunction = functions.firestore.document('Orders/{ordersId}').onCreate((snapshot,context)=>{
  return admin.messaging().sendToTopic('Orders',{notification:{title: 'Title',body: 'Body',clickAction: 'FLUTTER_NOTIFICATION_CLICK'},});

  })