$(document).ready(() => {
    let data = ["Hello"];

    const startAirtable = () => {
        fetch('https://api.airtable.com/v0/appZ8LaK94O90nJZ7/Applicants ', {
        method: "GET",
        headers: {
            Authorization: "Bearer keywgnRcsbspP22cH"
        }
        })
        .then(res => res.json())
        .then(res => {
        if(res) {
            data = res.records.map(record => record.fields).filter(record => record.Approved);
        }
        data.forEach((result, id) => resultsContainer.prepend(buildUser(id, result)));
        });
        }

    const buildUser = (id, userData) => {
        if(!userData || userData === "") return "";
        return `
            <div class="col-md-3" data-id="${id}">
                <div class="card network-card">
                <div class="card-body">
                    <h5 class="card-title name">${userData.Country}</h5>
                    <h1>HI</h1>
                </div>
            </div>
            `;
        }
    startAirtable();
});