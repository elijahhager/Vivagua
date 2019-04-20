const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

exports.addDivesite = functions.https.onCall((data, context) => {
    const divesites = admin.firestore().collection('divesites');
    console.log("Dive site added.")
    return divesites.add({
        name: data["name"],
        location: new admin.firestore.GeoPoint(data["latitude"], data["longitude"])
    });

});

exports.computeStats = functions.https.onCall((data, context) => {

    const statistics = admin.firestore().collection('statistics');

    admin.firestore().collection('divesites').get().then(snapshot => {
        snapshot.forEach(doc => {
            console.log(doc);
            statistics.add({
                name: "nameme"
            });
        });
        console.log("Tried to add.");
        return "";
    }).catch(reason => {
        console.log(reason);
    });

});

// we can do event based things here, like use onCreate, onDelete, 
// which will event handle in the cloud