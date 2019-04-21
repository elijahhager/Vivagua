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

exports.sightingsThisWeek = functions.https.onCall((data, context) => {

    var today = new Date();
    var sevenDaysAgo = today.getDate() - 7;

    const statistics = db.collection('statistics');

    const sightingsThisWeek = db.collection('sightings', ref => ref
        .where('timestamp', '>=', sevenDaysAgo)
        .where('timestamp', '<=', today)
    );

    sightingsThisWeek.get().then(snapshot => {

        var sightingData = {}

        snapshot.forEach(sighting_doc => {
            for (const spec_id in sighting_doc.data()) {

                if (spec_id === "divesite" || spec_id === "timestamp") continue;

                const numSeen = sighting_doc.data()[spec_id];

                if (sightingData[spec_id])
                    sightingData[spec_id] += numSeen;
                else
                    sightingData[spec_id] = numSeen;
            }
        });

        for (const spec_id in sightingData) {
            console.log("Wrote something to DB");
            statistics.doc(spec_id).set({
                "seenThisWeek": sightingData[spec_id]
            }, { merge: true });
        }

        console.log("Exited");

        return 0;

    }).catch(reason => {
        console.log(reason);
        return 1;
    });

});

exports.sightingsLastWeek = functions.https.onCall((data, context) => {

    var today = new Date();
    var sevenDaysAgo = today.getDate() - 7;
    var fourteenDaysAgo = today.getDate() - 14;

    const statistics = db.collection('statistics');

    const sightingsLastWeek = db.collection('sightings', ref => ref
        .where('timestamp', '>=', fourteenDaysAgo)
        .where('timestamp', '<=', sevenDaysAgo)
    );

    sightingsLastWeek.get().then(snapshot => {

        var sightingData = {}

        // looping through all the sightings regardless of divesite

        snapshot.forEach(sighting_doc => {
            for (const spec_id in sighting_doc.data()) {

                if (spec_id === "divesite" || spec_id === "timestamp") continue;

                const numSeen = sighting_doc.data()[spec_id];

                if (sightingData[spec_id])
                    sightingData[spec_id] += numSeen;
                else
                    sightingData[spec_id] = numSeen;
            }
        });

        for (const spec_id in sightingData) {
            statistics.doc(spec_id).set({
                "seenLastWeek": sightingData[spec_id]
            }, { merge: true });
        }

        return 0;

    }).catch(reason => {
        console.log(reason);
        return 1;
    });

});

// we can do event based things here, like use onCreate, onDelete, 
// which will event handle in the cloud

// we can do event based things here, like use onCreate, onDelete, 
// which will event handle in the cloud