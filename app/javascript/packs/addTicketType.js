const addTicketType = ()=> {
  const createButton = document.getElementById("addTicketType");
  createButton.addEventListener("click", () => {

    const lastId = document.querySelector('#fieldsetContainer').lastElementChild.id;

    const newId = parseInt(lastId, 10) + 1;

    const newFieldset = document.querySelector('[id=”0"]').outerHTML.replace(/0/g,newId);

    document.querySelector('#fieldsetContainer').insertAdjacentHTML(
        "beforeend", newFieldset
    );
  });
}
export { addTicketType }