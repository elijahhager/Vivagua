const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

const db = admin.firestore();

function databasify(str) {
    return str.replace(/\s+/g, '_').toLowerCase().replace(/\W/g, '');
}

exports.addDivesite = functions.https.onCall((data, context) => {

    const divesites = db.collection('divesites');
    console.log("Dive site added.")
    return divesites.add({
        name: data["name"],
        location: new admin.firestore.GeoPoint(data["latitude"], data["longitude"])
    });

});

function cleanSpecies() {

    const species = db.collection('species');
    return db.collection('species').get().then(snapshot => {
        snapshot.forEach(doc => {
            console.log(doc);
            var spec_id = databasify(doc.get("name"));
            species.doc(spec_id).set(doc.data())
        });
        console.log("Tried to add.");
        return 0;
    }).catch(reason => {
        console.log(reason);
        return 1;
    });

}

function cleanDivesites() {

    const divesites = db.collection('divesites');
    return db.collection('divesites').get().then(snapshot => {
        snapshot.forEach(doc => {
            console.log(doc);
            var divesite_id = databasify(doc.get("name"));
            divesites.doc(divesite_id).set(doc.data())
        });
        console.log("Tried to add.");
        return 0;
    }).catch(reason => {
        console.log(reason);
        return 1;
    });

}

function createStatStruct() {

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

}

function sightingsThisWeek() {

    console.log("Running sightings this week...");
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

}

function sightingsLastWeek() {

    console.log("Running sightings last week...");
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

}

function diversWhoSawAndDidNotSee() {

    console.log("diversWhoSaw, diversWhoDidNotSee...");
    var today = new Date();
    var thirtyDaysAgo = today.getDate() - 30;

    const statistics = db.collection('statistics');

    const sightingsInPastMonth = db.collection('sightings', ref => ref
        .where('timestamp', '>=', thirtyDaysAgo)
        .where('timestamp', '<=', today)
    );

    sightingsInPastMonth.get().then(snapshot => {

        var diverData = {}

        // looping through all the sightings regardless of divesite

        snapshot.forEach(sighting_doc => {

            // for every sighting document
            for (const spec_id in sighting_doc.data()) {

                if (spec_id === "divesite" || spec_id === "timestamp") continue;

                const numSeen = sighting_doc.data()[spec_id];

                if (diverData[spec_id])
                    if (numSeen > 0)
                        diverData[spec_id]["saw"] += 1;
                    else
                        diverData[spec_id]["didNotSee"] += 1;
                else
                    if (numSeen > 0)
                        diverData[spec_id] = { "saw": 1, "didNotSee": 0 }
                    else
                        diverData[spec_id] = { "saw": 0, "didNotSee": 1 }
            }
        });

        for (const spec_id in diverData) {
            statistics.doc(spec_id).set({
                "diversWhoSaw": diverData[spec_id]["saw"],
                "diversWhoDidNotSee": diverData[spec_id]["didNotSee"]
            }, { merge: true });
        }

        return 0;

    }).catch(reason => {
        console.log(reason);
        return 1;
    });

}

function countLogs() {

    console.log("Counting logs...");
    var today = new Date();
    var sevenDaysAgo = today.getDate() - 7;

    const sightingsThisWeek = db.collection('sightings', ref => ref
        .where('timestamp', '>=', sevenDaysAgo)
        .where('timestamp', '<=', today)
    );

    sightingsThisWeek.get().then(snapshot => {

        var totalLogs = 0;
        snapshot.forEach(sighting_doc => totalLogs += 1);
        console.log("Total logs: " + totalLogs);
        return totalLogs;

    }).catch(reason => {
        console.log(reason);
        return -1;
    });

}

// DIVESITE SPECIFIC DATA ANALYSIS

function diversWhoSawAndDidNotSeeDivesiteSpecific() {

    console.log("diversWhoSaw-/diversWhoDidNotSee- DivesiteSpecific");
    var today = new Date();
    var thirtyDaysAgo = today.getDate() - 30;

    const statistics = db.collection('statistics');

    const sightingsInPastMonth = db.collection('sightings', ref => ref
        .where('timestamp', '>=', thirtyDaysAgo)
        .where('timestamp', '<=', today)
    );

    sightingsInPastMonth.get().then(snapshot => {

        var diverData = {}

        // looping through all the sightings

        snapshot.forEach(sighting_doc => {

            const divesite_id = databasify(sighting_doc.data()["divesite"]);

            if (!diverData[divesite_id])
                diverData[divesite_id] = {};
            // for every sighting document
            for (const spec_id in sighting_doc.data()) {

                if (spec_id === "divesite" || spec_id === "timestamp") continue;

                const numSeen = sighting_doc.data()[spec_id];

                if (diverData[divesite_id][spec_id])
                    if (numSeen > 0)
                        diverData[divesite_id][spec_id]["saw"] += 1;
                    else
                        diverData[divesite_id][spec_id]["didNotSee"] += 1;
                else
                    if (numSeen > 0)
                        diverData[divesite_id][spec_id] = { "saw": 1, "didNotSee": 0 }
                    else
                        diverData[divesite_id][spec_id] = { "saw": 0, "didNotSee": 1 }
            }
        });

        for (const divesite_id in diverData)
            for (const spec_id in diverData[divesite_id])
                statistics.doc(spec_id).collection(divesite_id).doc("stats").set({
                    "diversWhoSaw": diverData[divesite_id][spec_id]["saw"],
                    "diversWhoDidNotSee": diverData[divesite_id][spec_id]["didNotSee"]
                }, { merge: true });

        return 0;

    }).catch(reason => {
        console.log(reason);
        return 1;
    });

}

exports.runAllStats = functions.firestore
    .document('sightings/{log}')
    .onWrite((change, context) => {

        console.log("Running all stats.");

        diversWhoSawAndDidNotSee();
        diversWhoSawAndDidNotSeeDivesiteSpecific();
        sightingsThisWeek();
        sightingsLastWeek();

        return 0;

    });