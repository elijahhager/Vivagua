const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

const db = admin.firestore();

exports.addDivesite = functions.https.onCall((data, context) => {
    const divesites = db.collection('divesites');
    console.log("Dive site added.")
    return divesites.add({
        name: data["name"],
        location: new admin.firestore.GeoPoint(data["latitude"], data["longitude"])
    });

});

exports.cleanSpecies = functions.https.onCall((data, context) => {

    const species = db.collection('species');
    return db.collection('species').get().then(snapshot => {
        snapshot.forEach(doc => {
            console.log(doc);
            var spec_id = doc.get("name").replace(/\s+/g, '_').toLowerCase().replace(/\W/g, '');
            species.doc(spec_id).set(doc.data())
        });
        console.log("Tried to add.");
        return 0;
    }).catch(reason => {
        console.log(reason);
        return 1;
    });

});

exports.cleanDivesites = functions.https.onCall((data, context) => {

    const divesites = db.collection('divesites');
    return db.collection('divesites').get().then(snapshot => {
        snapshot.forEach(doc => {
            console.log(doc);
            var divesite_id = doc.get("name").replace(/\s+/g, '_').toLowerCase().replace(/\W/g, '');
            divesites.doc(divesite_id).set(doc.data())
        });
        console.log("Tried to add.");
        return 0;
    }).catch(reason => {
        console.log(reason);
        return 1;
    });

});

exports.createStatStruct = functions.https.onCall((data, context) => {

    const divesites = db.collection('divesites');
    const species = db.collection('species');
    const statistics = db.collection('statistics');

    return species.get().then(snapshot => {

        snapshot.forEach(spec => {

            divesites.get().then(snapshot => {

                snapshot.forEach(divesite => { 
                    statistics.doc(spec.id).collection(divesite.id).doc("stats").set({
                        "seenThisWeek": 0,
                        "seenLastWeek": 0,
                        "diversWhoSaw": 0,
                        "diversWhoDidNotSee": 0
                    });

                    // all dive sites combined
                    statistics.doc(spec.id).set({
                        "seenThisWeek": 0,
                        "seenLastWeek": 0,
                        "diversWhoSaw": 0,
                        "diversWhoDidNotSee": 0
                    });

                });
                return 0;
            }).catch(reason => {
                console.log(reason);
                return 1;
            });

        });
        return 0;
    }).catch(reason => {
        console.log(reason);
        return 1;
    });

});

// we can do event based things here, like use onCreate, onDelete, 
// which will event handle in the cloud