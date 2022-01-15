let session = null;

let handleProgramParseFailure = (err) => {
    console.error("Could not parse program", err.toString())
}

let handleQueryParseFailure = (err) => {
    console.error("Could not parse query", err.toString())
}

let handleRuntimeError = (err) => {
    console.error("Unexpected error", err.toString())
}

let client = new XMLHttpRequest();
client.open('GET', '/logic/music.prolog');
client.onreadystatechange = () => {
    session = pl.create();

    session.consult(client.responseText, {
        success: () => {
            session.query("member(X, Notes). notes(Notes). ", {
                success: () => session.answers((answers) => console.log(session.format_answer(answers)), 2),
                error: handleQueryParseFailure
            });
        },
        error: handleProgramParseFailure
    });

}
client.send();


