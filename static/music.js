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
    window.session = pl.create();
    window.session.consult(client.responseText, {
        success: () => {
            window.session.query("notes(Notes). ", {
                success: () => window.session.answers((answers) => console.log(window.session.format_answer(answers)), 2),
                error: handleQueryParseFailure
            });
        },
        error: handleProgramParseFailure
    });

}
client.send();
const node = document.getElementById("query");
node.addEventListener("keyup", function(event) {
    if (event.key === "Enter") {
        window.session.query(node.value, {
            success: () => window.session.answers((answers) => console.log(window.session.format_answer(answers)), 2),
            error: handleQueryParseFailure
        });
    }
});

