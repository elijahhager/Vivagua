const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

exports.addDivesite = functions.https.onCall((data, context) => {
    const divesites = admin.firestore().collection('divesites');
    return divesites.add({
        name: data["name"],
        location: new admin.firestore.GeoPoint(data["latitude"], data["longitude"])
    });
});

exports.computeStats = functions.https.onCall((context) => {

    const divesites = admin.firestore().collection('divesites');
    const sightings = admin.firestore().collection('sightings');

    console.log(sightings);

    return 0;

});

// we can do event based things here, like use onCreate, onDelete, 
// which will event handle in the cloud