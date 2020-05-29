const db = require("../data/database.js");

function find() {
  return db("schemes");
}
function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  // SELECT * FROM schemes JOIN steps ON steps.scheme_id = id

  return db("schemes")
    .join("steps as s", "s.scheme_id", "schemes.id")
    .select("s.scheme_id", "scheme_name", "s.step_number", "s.instructions")
    .where("schemes.id", id)
    .orderBy("s.step_number");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then((response) => {
      return findById(response[0]);
    });
}

function addStep(stepData, id) {
    stepData.scheme_id = id;
    return db("steps").insert(stepData)
    .then(response => {
        return findById(response[0])
    })
    //ALTERNATIVE
    // return db("steps")
    // .insert({...stepData, scheme_id: id})
    // .where({ id })
}

function remove(id) {
  return db("schemes").where({ id }).del();
}
function update(changes, id) {
  return db("schemes").where({ id }).update(changes);
}

module.exports = {
  find,
  findById,
  findSteps,
  remove,
  add,
  addStep,
  update,
};
