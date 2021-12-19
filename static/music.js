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
client.open('GET', '/static/logic/music.pl');
client.onreadystatechange = () => {
    session = pl.create();

    session.consult(client.responseText, {
        success: () => {
            session.query("keys(X).", {
                success: () => {
                    session.answer({
                        success: (answer) => console.log(session.format_answer(answer)),
                        error: handleRuntimeError,
                        fail: function () { /* Fail */
                        },
                        limit: function () { /* Limit exceeded */
                        }
                    })
                },
                error: handleQueryParseFailure
            });
        },
        error: handleProgramParseFailure
    });

}
client.send();


